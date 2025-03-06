local colors = require("themer").get_theme_table("theme")

return {
	--- FIXME: red
	TodoFgFIX = { fg = colors.color1 },
	TodoBgFIX = { bg = colors.color1, fg = colors.background },
	TodoSignFIX = { link = "TodoFgFIX" },

	--- TODO: blue
	TodoFgTODO = { fg = colors.color4 },
	TodoBgTODO = { bg = colors.color4, fg = colors.background },
	TodoSignTODO = { link = "TodoFgTODO" },

	--- HACK: yellow
	TodoFgHACK = { fg = colors.color11 },
	TodoBgHACK = { bg = colors.color11, fg = colors.background },
	TodoSignHACK = { link = "TodoFgHACK" },

	--- WARN: violet
	TodoFgWARN = { fg = colors.color13 },
	TodoBgWARN = { bg = colors.color13, fg = colors.background },
	TodoSignWARN = { link = "TodoFgWARN" },

	--- PERF: rosa
	TodoFgPERF = { fg = colors.color5 },
	TodoBgPERF = { bg = colors.color5, fg = colors.background },
	TodoSignPERF = { link = "TodoFgPERF" },

	--- INFO: green
	TodoFgNOTE = { fg = colors.color2 },
	TodoBgNOTE = { bg = colors.color2, fg = colors.background },
	TodoSignNOTE = { link = "TodoFgNOTE" },

	--- TEST: cyan
	TodoFgTEST = { fg = colors.color6 },
	TodoBgTEST = { bg = colors.color6, fg = colors.background },
	TodoSignTEST = { link = "TodoFgTEST" },
}
