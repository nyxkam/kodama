local colors = require("themer").get_theme_table("theme")

return {
  MasonHeader = { bg = colors.color1, fg = colors.black },
  MasonHighlight = { fg = colors.color4 },
  MasonHighlightBlock = { fg = colors.black, bg = colors.color2 },
  MasonHighlightBlockBold = { link = "MasonHighlightBlock" },
  MasonHeaderSecondary = { link = "MasonHighlightBlock" },
  MasonMuted = { fg = colors.comment },
  MasonMutedBlock = { fg = colors.comment, bg = colors.color0 },
}
