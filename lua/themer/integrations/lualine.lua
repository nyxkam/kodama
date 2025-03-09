local colors = require("themer").get_theme_table("theme")
local darken = require("themer.colors").blend

local function darken_bg(color)
	return darken(color, colors.black, 0.15)
end

local styles = {
	Mode = colors.color4,
	Filename = colors.color1,
	Branch = colors.color13,
	Lsp = colors.color2,
	Tab = colors.color1,
	Progress = colors.color13,
	Location = colors.color11,
	Dir = colors.color1,
}

local theme = {
	LualineNothing = { bg = colors.black },
	LualineNothing2 = { bg = colors.black },
	LualineSeparator = { bg = colors.black },
	LualineDiffAddIcon = { fg = colors.color2, bg = colors.black },
	LualineDiffChangeIcon = { fg = colors.color3, bg = colors.black },
	LualineDiffRemoveIcon = { fg = colors.color1, bg = colors.black },
	LualineDiffAddText = { fg = colors.color2, bg = colors.black },
	LualineDiffChangeText = { fg = colors.color3, bg = colors.black },
	LualineDiffRemoveText = { fg = colors.color1, bg = colors.black },
	LualineDiagnosticsErrorIcon = { fg = colors.color9, bg = colors.black },
	LualineDiagnosticsWarnIcon = { fg = colors.color3, bg = colors.black },
	LualineDiagnosticsInfoIcon = { fg = colors.color12, bg = colors.black },
	LualineDiagnosticsHintIcon = { fg = colors.color14, bg = colors.black },
	LualineDiagnosticsErrorText = { fg = colors.color9, bg = colors.black },
	LualineDiagnosticsWarnText = { fg = colors.color3, bg = colors.black },
	LualineDiagnosticsInfoText = { fg = colors.color12, bg = colors.black },
	LualineDiagnosticsHintText = { fg = colors.color14, bg = colors.black },
}

for name, color in pairs(styles) do
	theme["Lualine" .. name .. "Icon"] = { fg = colors.darker, bg = color }
	theme["Lualine" .. name .. "Text"] = { fg = color, bg = darken_bg(color) }
end

theme.LualineModeText.bold = true
theme.LualineLocationText.bold = true

for _, section in ipairs({ "a", "b", "c", "x", "y", "z" }) do
	for _, mode in ipairs({ "normal", "insert", "visual", "command", "replace", "inactive", "terminal" }) do
		theme["lualine_" .. section .. "_" .. mode] = { bg = colors.black }
	end
end

return theme
