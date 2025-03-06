local colors = require("themer").get_theme_table("theme")
local darken = require("themer.colors").blend


local function darken_bg(color)
  return darken(color, colors.black, 0.15)
end

local styles = {
  Mode = colors.color4,
  Filename = colors.color1,
  Branch = colors.color13,
  DiffAdd = colors.color2,
  DiffChange = colors.color3,
  DiffRemove = colors.color1,
  DiagnosticsError = colors.color9,
  DiagnosticsWarn = colors.color11,
  DiagnosticsInfo = colors.color12,
  DiagnosticsHint = colors.color14,
  Lsp = colors.color2,
  Tab = colors.color1,
  Progress = colors.color13,
  Location = colors.color11,
  Dir = colors.color1,
}

local theme = {
  LualineNothing = { bg = colors.black },
  LualineNothing2 = { bg = colors.black },
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
