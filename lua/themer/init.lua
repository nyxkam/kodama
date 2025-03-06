local M = {}
local cache_path = vim.g.themeCache

-- Updates a value in the configuration file
local function update_config_value(key, value)
	local config_file_path = vim.fn.stdpath("config") .. "/lua/core/cfg.lua"
	local lines = {}
	local is_updated = false

	-- Read the configuration file
	local file = io.open(config_file_path, "r")
	if not file then
		vim.notify("Cannot read the configuration file", vim.log.levels.ERROR)
		return
	end

	-- Find and update the line containing the key
	for line in file:lines() do
		if line:match(key .. "%s*=") then
			local updated_line = "  " .. key .. " = " .. tostring(value) .. ","
			if updated_line ~= line then
				is_updated = true
				line = updated_line
			end
		end
		table.insert(lines, line)
	end
	file:close()

	-- Write changes if an update occurred
	if is_updated then
		file = io.open(config_file_path, "w")
		if file then
			for _, line in ipairs(lines) do
				file:write(line .. "\n")
			end
			file:close()
		else
			vim.notify("Cannot write to the configuration file", vim.log.levels.ERROR)
		end
	end
end

-- Retrieves the list of available integrations
M.get_integrations = function()
	local integrations_dir = vim.fn.stdpath("config") .. "/lua/themer/integrations/"
	local integration_files = vim.fn.glob(integrations_dir .. "*.lua", false, true)
	local integrations = {}

	for _, file in ipairs(integration_files) do
		local integration_name = vim.fn.fnamemodify(file, ":t:r")
		table.insert(integrations, integration_name)
	end

	return integrations
end

local available_integrations = M.get_integrations()

-- Retrieves the theme table based on the type (colors, highlights, etc.)
M.get_theme_table = function(theme_table)
	local theme_name = vim.g.nvimTheme
	local is_success, theme = pcall(require, "themer.schemes." .. theme_name)

	if is_success then
		return theme[theme_table]
	else
		error("Theme not found: " .. theme_name)
	end
end

-- Merges multiple tables into one
M.merge_tables = function(...)
	return vim.tbl_deep_extend("force", ...)
end

-- Extends default highlights with integrations and transparency
M.extend_default_highlights = function(highlights, integration_name)
	local polish_highlights = M.get_theme_table("polish_hl")

	-- Apply additional highlights if they exist
	if polish_highlights and polish_highlights[integration_name] then
		highlights = M.merge_tables(highlights, polish_highlights[integration_name])
	end

	-- Apply transparency if enabled
	if vim.g.transparency then
		local transparency_highlights = require("themer.transparency")

		for key, value in pairs(transparency_highlights) do
			if highlights[key] then
				highlights[key] = M.merge_tables(highlights[key], value)
			end
		end
	end

	return highlights
end

-- Retrieves the specific integration and extends its highlights
M.get_integration_highlights = function(integration_name)
	local highlights = require("themer.integrations." .. integration_name)
	return M.extend_default_highlights(highlights, integration_name)
end

-- Converts a highlights table to a Lua code string
M.highlights_to_string = function(highlights_table)
	local result = {}

	for highlight_group, options in pairs(highlights_table) do
		local group_name = "'" .. highlight_group .. "',"
		local options_list = {}

		for option_name, option_value in pairs(options) do
			local value_as_string = (type(option_value) == "boolean" or type(option_value) == "number")
					and tostring(option_value)
				or '"' .. option_value .. '"'
			table.insert(options_list, option_name .. "=" .. value_as_string)
		end

		table.insert(result, "vim.api.nvim_set_hl(0," .. group_name .. "{" .. table.concat(options_list, ",") .. "})")
	end

	return table.concat(result, "\n")
end

-- Saves a string to a cache file
M.save_to_cache = function(filename, content)
	local cache_content = "return string.dump(function()" .. content .. "end, true)"
	local file = io.open(cache_path .. filename, "wb")

	if file then
		file:write(load(cache_content)())
		file:close()
	else
		vim.notify("Cannot write to cache file: " .. filename, vim.log.levels.ERROR)
	end
end

-- Sets terminal colors
M.set_terminal_colors = function(colors)
	for i = 0, 15 do
		local color_key = "color" .. i
		if colors[color_key] then
			vim.g["terminal_color_" .. i] = colors[color_key]
		else
			vim.notify("Color '" .. color_key .. "' not found in theme", vim.log.levels.WARN)
		end
	end
end

-- Configures terminal colors
M.setup_terminal_colors = function()
	local colors = M.get_theme_table("theme")
	M.set_terminal_colors(colors)
	return "" -- No need to return a string
end

-- Compiles and saves highlights to cache files
M.compile_highlights = function()
	if not vim.uv.fs_stat(vim.g.themeCache) then
		vim.fn.mkdir(cache_path, "p")
	end

	M.save_to_cache("term", M.setup_terminal_colors())

	for _, integration_name in ipairs(available_integrations) do
		local highlights_string = M.highlights_to_string(M.get_integration_highlights(integration_name))

		if integration_name == "defaults" then
			highlights_string = "vim.o.tgc=true " .. highlights_string
		end

		M.save_to_cache(integration_name, highlights_string)
	end
end

-- Loads all highlights from cache files
M.load_all_highlights = function()
	require("plenary.reload").reload_module("themer")
	M.compile_highlights()

	for _, integration_name in ipairs(available_integrations) do
		dofile(vim.g.themeCache .. integration_name)
	end

	-- Update blankline if available
	pcall(function()
		require("ibl").update()
	end)

	vim.api.nvim_exec_autocmds("User", { pattern = "ThemeReload" })
end

-- Toggles transparency
M.toggle_transparency = function()
	if vim.g.transparency == nil then
		vim.g.transparency = false
	end
	vim.g.transparency = not vim.g.transparency

	update_config_value("transparency", tostring(vim.g.transparency))

	require("themer").load_all_highlights()
	require("plenary.reload").reload_module("thenmer")
	vim.notify("Transparency: " .. tostring(vim.g.transparency), vim.log.levels.INFO)
end

return M
