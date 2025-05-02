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

	-- Lualine por modo
	LualineModeNormalIcon = { fg = colors.black, bg = colors.color4 },
	LualineModeInsertIcon = { fg = colors.black, bg = colors.color2 },
	LualineModeVisualIcon = { fg = colors.black, bg = colors.color5 },
	LualineModeReplaceIcon = { fg = colors.black, bg = colors.color1 },
	LualineModeCommandIcon = { fg = colors.black, bg = colors.color3 },
	LualineModeTerminalIcon = { fg = colors.black, bg = colors.color6 },
	LualineModeSelectIcon = { fg = colors.black, bg = colors.color11 },

	LualineModeNormalText = { fg = colors.color4, bg = darken(colors.color4, colors.black, 0.1), bold = true },
	LualineModeInsertText = { fg = colors.color2, bg = darken(colors.color2, colors.black, 0.1), bold = true },
	LualineModeVisualText = { fg = colors.color5, bg = darken(colors.color5, colors.black, 0.1), bold = true },
	LualineModeReplaceText = { fg = colors.color1, bg = darken(colors.color1, colors.black, 0.1), bold = true },
	LualineModeCommandText = { fg = colors.color3, bg = darken(colors.color3, colors.black, 0.1), bold = true },
	LualineModeTerminalText = { fg = colors.color6, bg = darken(colors.color6, colors.black, 0.1), bold = true },
	LualineModeSelectText = { fg = colors.color11, bg = darken(colors.color11, colors.black, 0.1), bold = true },

	LualineModeNormalSeparator = { fg = colors.color4, bg = darken(colors.color4, colors.black, 0.1) },
	LualineModeInsertSeparator = { fg = colors.color2, bg = darken(colors.color2, colors.black, 0.1) },
	LualineModeVisualSeparator = { fg = colors.color5, bg = darken(colors.color5, colors.black, 0.1) },
	LualineModeReplaceSeparator = { fg = colors.color1, bg = darken(colors.color1, colors.black, 0.1) },
	LualineModeCommandSeparator = { fg = colors.color3, bg = darken(colors.color3, colors.black, 0.1) },
	LualineModeTerminalSeparator = { fg = colors.color6, bg = darken(colors.color6, colors.black, 0.1) },
	LualineModeSelectSeparator = { fg = colors.color11, bg = darken(colors.color11, colors.black, 0.1) },

	LualineModeNormalSeparator2 = { fg = darken(colors.color4, colors.black, 0.1), bg = colors.cursorline },
	LualineModeInsertSeparator2 = { fg = darken(colors.color2, colors.black, 0.1), bg = colors.cursorline },
	LualineModeVisualSeparator2 = { fg = darken(colors.color5, colors.black, 0.1), bg = colors.cursorline },
	LualineModeReplaceSeparator2 = { fg = darken(colors.color1, colors.black, 0.1), bg = colors.cursorline },
	LualineModeCommandSeparator2 = { fg = darken(colors.color3, colors.black, 0.1), bg = colors.cursorline },
	LualineModeTerminalSeparator2 = { fg = darken(colors.color6, colors.black, 0.1), bg = colors.cursorline },
	LualineModeSelectSeparator2 = { fg = darken(colors.color11, colors.black, 0.1), bg = colors.cursorline },

	LualineProgressIcon = { bg = colors.color2, fg = colors.black },
	LualineProgressText = { bg = darken(colors.color2, colors.black, 0.1), fg = colors.color2 },
	LualineProgressSeparator = { bg = colors.black, fg = colors.color2 },
	LualineBranchIcon = { bg = colors.black, fg = darken(colors.foreground, colors.black, 0.6) },
	LualineBranchText = { bg = colors.black, fg = darken(colors.foreground, colors.black, 0.6) },
	LualineLspIcon = { fg = colors.black, bg = colors.color13 },
	LualineLspText = { fg = colors.color13, bg = darken(colors.color13, colors.black, 0.1) },
	LualineLspSeparator = { bg = colors.black, fg = colors.color13 },
	LualineVenvIcon = { fg = colors.black, bg = colors.color11 },
	LualineVenvText = { fg = colors.color11, bg = darken(colors.color11, colors.black, 0.1) },
	LualineVenvSeparator = { bg = colors.black, fg = colors.color11 },

	-- Grupos inactivos
	LualineInactiveFilename = { bg = colors.darker, fg = colors.comment },
	LualineInactiveLocation = { bg = colors.darker, fg = colors.comment },

	-- Nuevos grupos para filetype
	LualineFiletypeIcon = { bg = colors.color5, fg = colors.black },
	LualineFiletypeText = { bg = colors.black, fg = colors.color5 },
}

--theme.LualineModeText.bold = true

for _, section in ipairs({ "a", "b", "c", "x", "y", "z" }) do
	for _, mode in ipairs({ "normal", "insert", "visual", "command", "replace", "inactive", "terminal" }) do
		theme["lualine_" .. section .. "_" .. mode] = { bg = colors.black }
	end
end

return theme
