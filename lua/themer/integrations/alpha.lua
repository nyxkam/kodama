local colors = require("themer").get_theme_table("theme")
local darken = require("themer.colors").blend

return {
  AlphaHeader = { fg = colors.color4, bg = colors.background },
  AlphaLabel = { fg = colors.color7, bg = colors.background },
  AlphaIcon = { fg = colors.color5, bold = true },
  AlphaKeyPrefix = { fg = colors.color1, bg = darken(colors.color1, colors.black, 0.2) },
  AlphaMessage = { fg = colors.color2, bg = colors.background },
  AlphaFooter = { fg = colors.comment, bg = colors.background },
}
