local countBuffer = function()
	return #vim.fn.getbufinfo({ buflisted = 1 })
end

local nothing = function()
	if vim.o.columns < 120 or countBuffer() < 2 then
		return "%#LualineNothing2#" .. ""
	end
	return "%#LualineNothing#" .. ""
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			icons_enabled = false,
			globalstatus = true,
			separator = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},

		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(mode_name)
						local icon = " "
						local text = " " .. mode_name .. " "
						return string.format("%%#%s#%s%%#%s#%s", "LualineModeIcon", icon, "LualineModeText", text)
					end,
					separator = { left = "", right = "" },
				},
				nothing(),
				{
					"filename",
					fmt = function(filename)
						local icon = require("nvim-web-devicons").get_icon(filename) or "󰈙 "
						local name = vim.fn.fnamemodify(filename, ":t")
						return string.format(
							"%%#%s#%s %%#%s#%s",
							"LualineFilenameIcon",
							icon,
							"LualineFilenameText",
							" " .. name .. " "
						)
					end,
					separator = { left = "", right = "" },
				},
				nothing(),
			},

			lualine_b = {
				{
					"branch",
					icons_enabled = false,
					fmt = function(branch_name)
						local icon = ""
						local git_status = vim.b.gitsigns_status_dict
						branch_name = (git_status and git_status.head) and git_status.head or "[N/A]"
						return string.format("%%#LualineBranchIcon#%s %%#LualineBranchText# %s", icon, branch_name)
					end,
					separator = { left = "", right = "" },
				},
			},

			lualine_c = {
				nothing(),
				{
					"diff",
					fmt = function()
						if not vim.b.gitsigns_status_dict then
							return ""
						end

						local git_status = vim.b.gitsigns_status_dict
						local added = (git_status.added and git_status.added ~= 0)
								and string.format(
									"%%#LualineDiffAddIcon#  %%#LualineDiffAddText# %d ",
									git_status.added
								)
							or ""

						local changed = (git_status.changed and git_status.changed ~= 0)
								and string.format(
									"%%#LualineDiffChangeIcon#   %%#LualineDiffChangeText# %d ",
									git_status.changed
								)
							or ""

						local removed = (git_status.removed and git_status.removed ~= 0)
								and string.format(
									"%%#LualineDiffRemoveIcon#   %%#LualineDiffRemoveText# %d ",
									git_status.removed
								)
							or ""

						if #added > 0 or #changed > 0 or #removed > 0 then
							return added .. changed .. removed
						end
						return ""
					end,
					separator = { left = "", right = "" },
				},
			},
			lualine_x = {
				nothing(),
				{
					"diagnostics",
					icons_enabled = false,
					sources = { "nvim_diagnostic" },
					fmt = function()
						local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
						local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
						local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
						local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

						local ERROR = (errors > 0)
								and string.format(
									"%%#LualineDiagnosticsErrorIcon#  %%#LualineDiagnosticsErrorText# %d",
									errors .. " "
								)
							or ""

						local WARNING = (warnings > 0)
								and string.format(
									"%%#LualineDiagnosticsWarnIcon# 󱒼  %%#LualineDiagnosticsWarnText# %d ",
									warnings .. " "
								)
							or ""

						local HINT = (hints > 0)
								and string.format(
									"%%#LualineDiagnosticsHintIcon# 󰌵 %%#LualineDiagnosticsHintText# %d ",
									hints .. " "
								)
							or ""

						local INFO = (info > 0)
								and string.format(
									"%%#LualineDiagnosticsInfoIcon#   %%#LualineDiagnosticsInfoText# %d ",
									info .. " "
								)
							or ""

						return ERROR .. " " .. WARNING .. " " .. HINT .. " " .. INFO .. " "
					end,
					separator = { left = "", right = "" },
				},
				nothing(),
				{
					"lsp",
					fmt = function()
						local icon = " "
						local buf = vim.api.nvim_get_current_buf()

						for _, client in ipairs(vim.lsp.get_clients()) do
							if client.attached_buffers and client.attached_buffers[buf] then
								return string.format(
									"%%#%s#%s %%#%s# %s",
									"LualineLspIcon",
									icon,
									"LualineLspText",
									client.name
								)
							end
						end

						return ""
					end,
					separator = { left = "", right = "" },
				},

				nothing(),
				{
					"directory",
					fmt = function()
						local icon = " " -- Icono de carpeta
						local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						return string.format("%%#LualineDirIcon#%s %%#LualineDirText# %s", icon, cwd)
					end,
					separator = { left = "", right = "" },
				},
			},
			lualine_y = {
				nothing(),
				{
					"progress",
					fmt = function()
						local chars = { " ", "󰪞 ", "󰪟 ", "󰪠 ", "󰪢 ", "󰪣 ", "󰪤 ", "󰪥 " }
						local current_line = vim.fn.line(".")
						local total_lines = vim.fn.line("$")
						local index = math.floor((current_line / total_lines) * (#chars - 1)) + 1

						index = math.max(1, math.min(#chars, index))

						return string.format(
							"%%#LualineProgressIcon#%s %%#LualineProgressText# %d%%%% ",
							chars[index],
							math.floor((current_line / total_lines) * 100)
						)
					end,
					separator = { left = "", right = "" },
				},
			},
			lualine_z = {
				nothing(),
				{
					"location",
					fmt = function()
						local icon = " "
						local line = vim.fn.line(".")
						local col = vim.fn.col(".")
						return string.format(
							"%%#LualineLocationIcon#%s %%#LualineLocationText# %d:%d ",
							icon,
							line,
							col
						)
					end,
					separator = { left = "", right = "" },
				},
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
	},
}
