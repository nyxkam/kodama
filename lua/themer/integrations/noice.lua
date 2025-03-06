local colors = require("themer").get_theme_table("theme")
local darken = require("themer.colors").blend

return {
	NoiceMini = { bg = colors.darker, fg = colors.color15 },
	NoiceCmdlinePopup = { bg = colors.darker, fg = colors.color15 },
	NoiceCmdlinePopupBorder = { bg = "NONE", fg = colors.darker },
	NoiceCmdlinePopupBorderSearch = { link = "NoiceCmdlinePopupBorder" },
	NoiceCmdlinePopupTitle = { bg = colors.darker, fg = colors.color1, bold = true },
	NoiceCmdlinePopupTitleCmdline = { bg = colors.color4, fg = colors.black, bold = true },
	NoiceCmdlinePopupTitleHelp = { bg = colors.color1, fg = colors.black, bold = true },
	NoiceCmdlinePopupTitleSearch = { bg = colors.color4, fg = colors.black, bold = true },
	NoiceCmdlinePopupTitleFilter = { bg = colors.color11, fg = colors.black, bold = true },
	NoiceLspProgressSpinner = { fg = darken(colors.color15, colors.black, 0.2) },
}
