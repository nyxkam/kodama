local colors = require("themer").get_theme_table("theme")
local darken = require("themer.colors").blend

return {
	CmpItemKindFolder = { fg = colors.color4, bg = darken(colors.color4, colors.black, 0.2) },
	CmpItemKindFunction = { fg = colors.color6, bg = darken(colors.color6, colors.black, 0.2) },
	CmpItemKindInterface = { fg = colors.color13, bg = darken(colors.color13, colors.black, 0.2) },
	CmpItemKindKey = { fg = colors.color3, bg = darken(colors.color3, colors.black, 0.2) },
	CmpItemKindKeyword = { fg = colors.color1, bg = darken(colors.color1, colors.black, 0.2) },
	CmpItemKindMethod = { fg = colors.color6, bg = darken(colors.color6, colors.black, 0.2) },
	CmpItemKindModule = { fg = colors.color2, bg = darken(colors.color2, colors.black, 0.2) },
	CmpItemKindNamespace = { fg = colors.color4, bg = darken(colors.color4, colors.black, 0.2) },
	CmpItemKindNull = { fg = colors.color8, bg = darken(colors.color8, colors.black, 0.2) },
	CmpItemKindNumber = { fg = colors.color3, bg = darken(colors.color3, colors.black, 0.2) },
	CmpItemKindObject = { fg = colors.color13, bg = darken(colors.color13, colors.black, 0.2) },
	CmpItemKindOperator = { fg = colors.color9, bg = darken(colors.color9, colors.black, 0.2) },
	CmpItemKindPackage = { fg = colors.color2, bg = darken(colors.color2, colors.black, 0.2) },
	CmpItemKindProperty = { fg = colors.color5, bg = darken(colors.color5, colors.black, 0.2) },
	CmpItemKindReference = { fg = colors.color4, bg = darken(colors.color4, colors.black, 0.2) },
	CmpItemKindSnippet = { fg = colors.color11, bg = darken(colors.color11, colors.black, 0.2) },
	CmpItemKindString = { fg = colors.color10, bg = darken(colors.color10, colors.black, 0.2) },
	CmpItemKindStruct = { fg = colors.color13, bg = darken(colors.color13, colors.black, 0.2) },
	CmpItemKindText = { fg = colors.color7, bg = darken(colors.color7, colors.black, 0.2) },
	CmpItemKindTypeParameter = { fg = colors.color6, bg = darken(colors.color6, colors.black, 0.2) },
	CmpItemKindUnit = { fg = colors.color3, bg = darken(colors.color3, colors.black, 0.2) },
	CmpItemKindValue = { fg = colors.color5, bg = darken(colors.color5, colors.black, 0.2) },
	CmpItemKindVariable = { fg = colors.color4, bg = darken(colors.color4, colors.black, 0.2) },
	CmpItemKindCodeium = { fg = colors.color7, bg = darken(colors.color7, colors.black, 0.2) },
	CmpItemKindSupermaven = { fg = colors.color2, bg = darken(colors.color2, colors.black, 0.2) },
	CmpItemKindArray = { fg = colors.color12, bg = darken(colors.color12, colors.black, 0.2) },
	CmpItemKindBoolean = { fg = colors.color9, bg = darken(colors.color9, colors.black, 0.2) },
	CmpItemKindClass = { fg = colors.color13, bg = darken(colors.color13, colors.black, 0.2) },
	CmpItemKindConstant = { fg = colors.color3, bg = darken(colors.color3, colors.black, 0.2) },
	CmpItemKindEnum = { fg = colors.color10, bg = darken(colors.color10, colors.black, 0.2) },
	CmpItemKindEnumMember = { fg = colors.color10, bg = darken(colors.color10, colors.black, 0.2) },
	CmpItemKindEvent = { fg = colors.color12, bg = darken(colors.color12, colors.black, 0.2) },
	CmpItemKindTypeAlias = { fg = colors.color6, bg = darken(colors.color6, colors.black, 0.2) },
	CmpItemKindField = { fg = colors.color5, bg = darken(colors.color5, colors.black, 0.2) },

	-- Otros elementos del cmp
	CmpItemAbbr = { fg = colors.color15 },
	CmpItemAbbrDeprecated = { fg = colors.color11 },
	CmpItemAbbrMatch = { fg = colors.color2 },
	CmpItemAbbrMatchFuzzy = { fg = colors.color1 },
	CmpItemKind = { fg = colors.color15 },
	CmpItemMenu = { fg = colors.color6 },
	CmpDoc = { bg = colors.color8 },
	CmpPmenu = { fg = colors.foreground, bg = colors.darker },
	CmpBorder = { fg = colors.darker, bg = colors.darker },
	PmenuSel = { bg = darken(colors.color4, colors.black, 0.1) },
	PmenuSbar = { bg = colors.darker },
	PmenuThumb = { bg = colors.color2 },
}
