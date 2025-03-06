local colors = require("themer").get_theme_table("theme")
local blend = require("themer.colors").blend

return {
  Added = { fg = colors.color2 },                              -- Verde
  Removed = { fg = colors.color1 },                            -- Rojo
  Changed = { fg = colors.color3 },                            -- Amarillo
  MatchWord = { bg = colors.color8, fg = colors.color15 },     -- Resaltado de coincidencia
  Pmenu = { bg = colors.color0 },                              -- Menú desplegable
  PmenuSbar = { bg = colors.color0 },                          -- Barra de desplazamiento del menú
  PmenuSel = { bg = colors.color4, fg = colors.black },        -- Elemento seleccionado en el menú
  PmenuThumb = { bg = colors.color8 },                         -- Control deslizante del menú
  MatchParen = { link = "MatchWord" },                         -- Coincidencia de paréntesis
  Comment = { fg = colors.comment },                           -- Comentarios
  CursorLineNr = { fg = colors.color3, bold = true },          -- Número de línea del cursor
  LineNr = { fg = colors.color8 },                             -- Números de línea
  FloatBorder = { fg = colors.color8 },                        -- Borde de ventanas flotantes
  FloatTitle = { fg = colors.black, bg = colors.color4 },      -- Título de ventanas flotantes
  NormalFloat = { bg = colors.darker },                        -- Fondo de ventanas flotantes
  NvimInternalError = { fg = colors.color1 },                  -- Errores internos de Neovim
  WinSeparator = { fg = colors.color8 },                       -- Separador de ventanas
  Normal = { fg = colors.foreground, bg = colors.background }, -- Texto normal
  DevIconDefault = { fg = colors.color1 },                     -- Iconos por defecto
  Debug = { fg = colors.color1 },                              -- Depuración
  Directory = { fg = colors.color4 },                          -- Directorios
  Error = { fg = colors.background, bg = colors.color1 },      -- Errores
  ErrorMsg = { fg = colors.color1, bg = colors.background },   -- Mensajes de error
  Exception = { fg = colors.color1 },                          -- Excepciones
  FoldColumn = { fg = colors.color5 },                         -- Columna de pliegues
  Folded = { fg = colors.color5, bg = colors.color0 },         -- Pliegues
  IncSearch = { fg = colors.color0, bg = colors.color11 },     -- Búsqueda incremental
  Macro = { fg = colors.color1 },                              -- Macros
  ModeMsg = { fg = colors.color2 },                            -- Mensajes de modo
  MoreMsg = { fg = colors.color2 },                            -- Más mensajes
  Question = { fg = colors.color4 },                           -- Preguntas
  Search = { fg = colors.color0, bg = colors.color3 },         -- Búsqueda
  Substitute = { fg = colors.color0, bg = colors.color3 },     -- Sustitución
  SpecialKey = { fg = colors.comment },                        -- Teclas especiales
  TooLong = { fg = colors.color1 },                            -- Líneas demasiado largas
  Visual = { bg = colors.color8 },                             -- Selección visual
  VisualNOS = { fg = colors.color1 },                          -- Selección visual no activa
  WarningMsg = { fg = colors.color1 },                         -- Mensajes de advertencia
  WildMenu = { fg = colors.color1, bg = colors.color3 },       -- Menú de autocompletado
  Title = { fg = colors.color4 },                              -- Títulos
  Conceal = { bg = "NONE" },                                   -- Ocultar
  Cursor = { fg = colors.background, bg = colors.foreground }, -- Cursor
  NonText = { fg = colors.comment },                           -- Texto no visible
  SignColumn = { fg = colors.comment },                        -- Columna de signos
  ColorColumn = { bg = colors.color0 },                        -- Columna de color
  CursorColumn = { bg = colors.color0 },                       -- Columna del cursor
  CursorLine = { bg = colors.color0 },                         -- Línea del cursor
  QuickFixLine = { bg = colors.color0 },                       -- Línea de corrección rápida
  healthSuccess = { bg = colors.color2, fg = colors.black },   -- Estado de salud exitoso
  WinBar = { bg = "NONE" },                                    -- Barra de ventana
  WinBarNC = { bg = "NONE" },                                  -- Barra de ventana no activa
  StatusLine = { bg = colors.black },                          -- Línea de estado
  StatusLineNC = { bg = colors.black },                        -- Línea de estado no activa

  -- lazy.nvim
  LazyH1 = { bg = colors.color2, fg = colors.black },             -- Título principal de Lazy
  LazyButton = { bg = colors.color0, fg = colors.color7 },        -- Botones de Lazy
  LazyH2 = { fg = colors.color1, bold = true, underline = true }, -- Subtítulo de Lazy
  LazyReasonPlugin = { fg = colors.color1 },                      -- Razón del plugin
  LazyValue = { fg = colors.color6 },                             -- Valores de Lazy
  LazyDir = { fg = colors.foreground },                           -- Directorios de Lazy
  LazyUrl = { fg = colors.foreground },                           -- URLs de Lazy
  LazyCommit = { fg = colors.color2 },                            -- Commits de Lazy
  LazyNoCond = { fg = colors.color1 },                            -- Sin condición
  LazySpecial = { fg = colors.color4 },                           -- Especial de Lazy
  LazyReasonFt = { fg = colors.color5 },                          -- Razón de tipo de archivo
  LazyOperator = { fg = colors.color7 },                          -- Operadores de Lazy
  LazyReasonKeys = { fg = colors.color6 },                        -- Razón de teclas
  LazyTaskOutput = { fg = colors.color7 },                        -- Salida de tareas
  LazyCommitIssue = { fg = colors.color13 },                      -- Problemas de commit
  LazyReasonEvent = { fg = colors.color3 },                       -- Razón de eventos
  LazyReasonStart = { fg = colors.color7 },                       -- Razón de inicio
  LazyReasonRuntime = { fg = colors.color4 },                     -- Razón de tiempo de ejecución
  LazyReasonCmd = { fg = colors.color11 },                        -- Razón de comandos
  LazyReasonSource = { fg = colors.color6 },                      -- Razón de fuente
  LazyReasonImport = { fg = colors.color7 },                      -- Razón de importación
  LazyProgressDone = { fg = colors.color2 },                      -- Progreso completado

  -- IndentBlankline
  IblIndent = { fg = blend(colors.comment, colors.black, 0.15) }, -- Indentación
  IblScope = { fg = blend(colors.comment, colors.black, 0.15) },  -- Ámbito de indentación
}
