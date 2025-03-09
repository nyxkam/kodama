local M = {}

-- Cache for common icons and functions
local devicons = require("nvim-web-devicons")
local sep = { left = "", right = "" }

-- Helper function for fonmatting elements with icons
local function format_component(icon, text, icon_hl, text_hl)
	return string.format("%%#%s#%s %%#%s# %s", icon_hl, icon, text_hl, text)
end

local function format_alert(icon, text, icon_hl, text_hl)
	return string.format("%%#%s#%s%%#%s# %s", icon_hl, icon, text_hl, text)
end

-- More efficient conditional helper function
local function should_hide()
	return vim.o.columns < 120 or #vim.fn.getbufinfo({ buflisted = 1 }) < 2
end

local function spacer()
	return should_hide() and "%#LualineNothing2#" or "%#LualineNothing#"
end

local mode_component = {
	function()
		local mode_map = {
			n = "NORMAL",
			i = "INSERT",
			v = "VISUAL",
			V = "V-LINE",
			[""] = "V-BLOCK", -- Ctrl+V
			t = "TERMINAL",
			c = "COMMAND",
			R = "REPLACE",
			s = "SELECT",
			S = "S-LINE",
			[""] = "S-BLOCK",
		}

		local current_mode = vim.fn.mode()
		local mode = mode_map[current_mode] or current_mode:upper()

		return format_component("", mode, "LualineModeIcon", "LualineModeText")
	end,
	separator = sep,
}

local filename_component = {
	"filename",
	fmt = function(filename)
		local icon = devicons.get_icon(filename) or "󰈙 "
		local name = vim.fn.fnamemodify(filename, ":t")
		return format_component(icon, name, "LualineFilenameIcon", "LualineFilenameText")
	end,
	separator = sep,
}

local branch_component = {
	"branch",
	fmt = function(branch)
		if not branch or branch == "" then
			return ""
		end
		return format_component("", branch, "LualineBranchIcon", "LualineBranchText")
	end,
	separator = sep,
}

local diff_component = {
	"diff",
	fmt = function()
		local status = vim.b.gitsigns_status_dict
		if not status then
			return ""
		end

		local components = {
			{ status.added, "  ", "LualineDiffAddIcon", "LualineDiffAddText" },
			{ status.changed, "  ", "LualineDiffChangeIcon", "LualineDiffChangeText" },
			{ status.removed, "  ", "LualineDiffRemoveIcon", "LualineDiffRemoveText" },
		}

		local result = {}
		for _, item in ipairs(components) do
			if item[1] and item[1] > 0 then
				table.insert(result, format_alert(item[2], item[1], item[3], item[4]))
			end
		end

		return table.concat(result, " ")
	end,
	separator = sep,
}

local diagnostics_component = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	fmt = function()
		local severities = {
			{ "ERROR", "  ", "LualineDiagnosticsErrorIcon", "LualineDiagnosticsErrorText" },
			{ "WARN", " 󱒼 ", "LualineDiagnosticsWarnIcon", "LualineDiagnosticsWarnText" },
			{ "HINT", " 󰌵 ", "LualineDiagnosticsHintIcon", "LualineDiagnosticsHintText" },
			{ "INFO", "  ", "LualineDiagnosticsInfoIcon", "LualineDiagnosticsInfoText" },
		}

		local result = {}
		for _, s in ipairs(severities) do
			local count = #vim.diagnostic.get(0, { severity = s[1] })
			if count > 0 then
				table.insert(result, format_alert(s[2], count .. "", s[3], s[4]))
			end
		end

		return table.concat(result, "")
	end,
	separator = sep,
}

local lsp_component = {
	function()
		local buf = vim.api.nvim_get_current_buf()
		for _, client in ipairs(vim.lsp.get_clients({ bufnr = buf })) do
			if client.attached_buffers[buf] then
				return format_component(" ", client.name, "LualineLspIcon", "LualineLspText")
			end
		end
		return ""
	end,
	separator = sep,
}

local directory_component = {
	function()
		return format_component(" ", vim.fn.fnamemodify(vim.fn.getcwd(), ":t"), "LualineDirIcon", "LualineDirText")
	end,
	separator = sep,
}

local progress_component = {
	"progress",
	fmt = function()
		local chars = { " ", "󰪞 ", "󰪟 ", "󰪠 ", "󰪢 ", "󰪣 ", "󰪤 ", "󰪥 " }
		local current = vim.fn.line(".")
		local total = math.max(1, vim.fn.line("$"))
		local index = math.floor((current / total) * (#chars - 1)) + 1

		index = math.max(1, math.min(index, #chars))

		return format_component(
			chars[index],
			math.floor((current / total) * 100) .. "%% ",
			"LualineProgressIcon",
			"LualineProgressText"
		)
	end,
	separator = sep,
}

local location_component = {
	"location",
	fmt = function()
		return format_component(
			" ",
			string.format("%d:%d ", vim.fn.line("."), vim.fn.col(".")),
			"LualineLocationIcon",
			"LualineLocationText"
		)
	end,
	separator = sep,
}

M.opts = {
	options = {
		theme = "auto",
		icons_enabled = false,
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		refresh = { statusline = 100 },
	},

	sections = {
		lualine_a = {
			mode_component,
			spacer,
			filename_component,
			spacer,
		},

		lualine_b = {
			branch_component,
		},

		lualine_c = {
			spacer,
			diff_component,
		},

		lualine_x = {
			spacer,
			diagnostics_component,
			spacer,
			lsp_component,
			spacer,
			directory_component,
		},

		lualine_y = {
			spacer,
			progress_component,
		},

		lualine_z = {
			spacer,
			location_component,
		},
	},

	inactive_sections = {
		lualine_c = { "filename" },
		lualine_x = { "location" },
	},
}
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = M.opts,
}
