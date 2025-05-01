-- nombre_tema.lua
local M = {}

-- Paleta de colores (define tus colores aquí)
local colors = {
  -- Base (5 colores)
  bg         = '#0f172a', -- Midnight (fondo principal)
  bg_alt     = '#1e293b', -- Twilight (paneles, línea activa)
  bg_light   = '#334155', -- Storm (para resaltes sutiles)
  fg         = '#e2e8f0', -- Frost (texto principal)
  fg_dark    = '#94a3b8', -- Mist (texto secundario)

  -- Acentos fríos vibrantes (6 colores)
  blue_light = '#7dd3fc', -- Glacier (funciones, resaltes)
  blue_dark  = '#0ea5e9', -- Peacock (números, brackets)
  green      = '#4ade80', -- Pine (strings, éxito)
  purple     = '#a78bfa', -- Iris (keywords)
  red        = '#ef4444', -- Blood (errores, warnings)
  cyan       = '#22d3ee', -- Ice (tipos, imports)

  -- Tonos especiales (5 colores)
  orange     = '#fb923c', -- Ember (constantes, números)
  pink       = '#f472b6', -- Blossom (funciones especiales)
  yellow     = '#facc15', -- Gold (operadores)
  teal       = '#2dd4bf', -- Lagoon (métodos)
  gray       = '#64748b', -- Slate (comentarios)
}

-- Aplicar a grupos de highlight:
vim.api.nvim_set_hl(0, 'Function', { fg = colors.keyword, bold = true })
vim.api.nvim_set_hl(0, 'String', { fg = colors.string, italic = true })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = colors.error, bg = colors.panel })
vim.api.nvim_set_hl(0, '@function.builtin', { fg = colors.blue_light, bold = true }) -- Funciones built-in
vim.api.nvim_set_hl(0, '@operator', { fg = colors.yellow })                          -- Operadores
vim.api.nvim_set_hl(0, '@property', { fg = colors.teal, italic = true })             -- Propiedades

-- Configuración del tema
function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background = "dark" -- o 'light'
  vim.o.termguicolors = true

  -- Definición de grupos de highlight
  local highlight = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Aplicar colores
  highlight("Normal", { fg = colors.white, bg = colors.black })
  highlight("Comment", { fg = colors.gray, italic = true })
  highlight("Constant", { fg = colors.purple })
  highlight("String", { fg = colors.yellow })
  highlight("Identifier", { fg = colors.blue })
  highlight("Function", { fg = colors.green })
  highlight("Statement", { fg = colors.red })
  highlight("Type", { fg = colors.cyan })
end

return M
