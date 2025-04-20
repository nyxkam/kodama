local M = {}

M.theme = {
	comment = "#7f849c",
	background = "#1e1e2e",
	black = "#1e1e2e",
	darker = "#181825",
	foreground = "#cdd6f4",
	cursorline = "#313244",
	cursor = "#f5c2e7",
	color0 = "#45475a",
	color1 = "#f38ba8",
	color2 = "#a6e3a1",
	color3 = "#f9e2af",
	color4 = "#89b4fa",
	color5 = "#f5c2e7",
	color6 = "#94e2d5",
	color7 = "#bac2de",
	color8 = "#585b70",
	color9 = "#f38ba8",
	color10 = "#a6e3a1",
	color11 = "#f9e2af",
	color12 = "#89b4fa",
	color13 = "#cba6f7",
	color14 = "#94e2d5",
	color15 = "#a6adc8",
}

M.polish_hl = {
	treesitter = {
		["@variable"] = { fg = M.theme.color13 },
		["@property"] = { fg = M.theme.color14 },
		["@variable.builtin"] = { fg = M.theme.color9 },
	},
}

return M
