local colors = require("themer").get_theme_table("theme")

return {
	NUICancel = { fg = colors.comment },
	NUIHeading = { bg = colors.black, fg = colors.color1 },
	NUILine = { bg = colors.black, fg = colors.comment },
	NUINo = { fg = colors.color1 },
	NUINormal = { bg = colors.black, fg = colors.black },
	NUIPrompt = { bg = colors.black, fg = colors.color4 },
	NUIText = { bg = colors.black, fg = colors.foreground },
	NUIYes = { fg = colors.color4 },
}
