local colors = require("themer").get_theme_table("theme")

return {
	NotifyBackground = { bg = colors.darker },
	NotifyLogTime = { bg = colors.darker },

	NotifyINFOBorder = { fg = colors.darker, bg = colors.darker },
	NotifyWARNBorder = { fg = colors.darker, bg = colors.darker },
	NotifyERRORBorder = { fg = colors.darker, bg = colors.darker },
	NotifyDEBUGBorder = { fg = colors.darker, bg = colors.darker },
	NotifyTRACEBorder = { fg = colors.darker, bg = colors.darker },

	NotifyERRORIcon = { fg = colors.color1, bg = colors.darker },
	NotifyWARNIcon = { fg = colors.color3, bg = colors.darker },
	NotifyINFOIcon = { fg = colors.color4, bg = colors.darker },
	NotifyDEBUGIcon = { fg = colors.color4, bg = colors.darker },
	NotifyTRACEIcon = { fg = colors.color1, bg = colors.darker },

	NotifyERRORTitle = { fg = colors.color1, bg = colors.darker },
	NotifyWARNTitle = { fg = colors.color3, bg = colors.darker },
	NotifyINFOTitle = { fg = colors.color4, bg = colors.darker },
	NotifyDEBUGTitle = { fg = colors.color5, bg = colors.darker },
	NotifyTRACETitle = { fg = colors.color4, bg = colors.darker },

	NotifyERRORBody = { fg = colors.color1, bg = colors.darker },
	NotifyWARNBody = { fg = colors.color3, bg = colors.darker },
	NotifyINFOBody = { fg = colors.color4, bg = colors.darker },
	NotifyDEBUGBody = { fg = colors.color2, bg = colors.darker },
	NotifyTRACEBody = { fg = colors.color2, bg = colors.darker },
}
