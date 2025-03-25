local colors = require("themer").get_theme_table("theme")
local darken = require("themer.colors").blend

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
	-- Grupos activos
	LualineDotIcon = { bg = colors.color4, fg = colors.black },
	LualineFilenameIcon = { bg = colors.cursorline, fg = darken(colors.foreground, colors.black, 0.6) },
	LualineFilenameText = { bg = colors.cursorline, fg = darken(colors.foreground, colors.black, 0.6) },
	LualineFilenameSeparator = { bg = colors.background, fg = colors.cursorline },
	LualineDirIcon = { fg = colors.black, bg = colors.color9 },
	LualineDirText = { fg = colors.color9, bg = darken(colors.color9, colors.black, 0.1) },
	LualineDirSeparator = { bg = colors.black, fg = colors.color9 },
	LualineModeIcon = { bg = colors.color12, fg = colors.black },
	LualineModeSeparator = { bg = darken(colors.color12, colors.black, 0.1), fg = colors.color12 },
	LualineModeSeparator2 = { bg = colors.cursorline, fg = darken(colors.color12, colors.black, 0.1) },
	LualineModeText = { bg = darken(colors.color12, colors.black, 0.1), fg = colors.color12 },
	LualineProgressIcon = { bg = colors.color2, fg = colors.black },
	LualineProgressText = { bg = darken(colors.color2, colors.black, 0.1), fg = colors.color2 },
	LualineProgressSeparator = { bg = colors.black, fg = colors.color2 },
	LualineBranchIcon = { bg = colors.black, fg = darken(colors.foreground, colors.black, 0.6) },
	LualineBranchText = { bg = colors.black, fg = darken(colors.foreground, colors.black, 0.6) },
	LualineLspIcon = { fg = colors.black, bg = colors.color13 },
	LualineLspText = { fg = colors.color13, bg = darken(colors.color13, colors.black, 0.1) },
	LualineLspSeparator = { bg = colors.black, fg = colors.color13 },

	-- Grupos inactivos
	LualineInactiveFilename = { bg = colors.darker, fg = colors.comment },
	LualineInactiveLocation = { bg = colors.darker, fg = colors.comment },

	-- Nuevos grupos para filetype
	LualineFiletypeIcon = { bg = colors.color5, fg = colors.black },
	LualineFiletypeText = { bg = colors.black, fg = colors.color5 },
}

theme.LualineModeText.bold = true

for _, section in ipairs({ "a", "b", "c", "x", "y", "z" }) do
	for _, mode in ipairs({ "normal", "insert", "visual", "command", "replace", "inactive", "terminal" }) do
		theme["lualine_" .. section .. "_" .. mode] = { bg = colors.black }
	end
end

return theme
