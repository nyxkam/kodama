local colors = require("themer").get_theme_table("theme")
local darken = require("themer.colors").blend

local function generate_icon_colors(icon_colors)
	local icons = {}
	for icon, color in pairs(icon_colors) do
		icons["BufferLineDevIcon" .. icon] = { fg = color, bg = colors.color0 }
		icons["BufferLineDevIcon" .. icon .. "Selected"] = { fg = colors.background, bg = colors.color4 }
	end
	return icons
end

local icon_colors = {
	Csproj = colors.color10,
	C = colors.color4,
	Csharp = colors.color4,
	Lua = colors.color12,
	Py = colors.color10,
	css = colors.color6,
	deb = colors.color1,
	Dockerfile = colors.color14,
	html = colors.color11,
	jpeg = colors.color13,
	js = colors.color3,
	Java = colors.color9,
	Dart = colors.color12,
	Vue = colors.color2,
	TSX = colors.color4,
	JSX = colors.color4,
	Svelte = colors.color1,
	Vim = colors.color10,
	README = colors.color5,
	LICENSE = colors.color2,
	package = colors.color3,
	json = colors.color7,
	xml = colors.color13,
	Php = colors.color13,
	Cpp = colors.color12,
	Default = colors.color1,
	H = colors.color5,
	conf = colors.color6,
	yaml = colors.color7,
	toml = colors.color3,
	ini = colors.color5,
	env = colors.color2,
	lock = colors.color8,
	log = colors.color9,
	csv = colors.color11,
	db = colors.color4,
	Makefile = colors.color9,
	gitignore = colors.color8,
	Bashrc = colors.color4,
	Zshrc = colors.color4,
	Nushell = colors.color13,
	Openbox = colors.color5,
	Xresources = colors.color4,
}

local icon_styles = generate_icon_colors(icon_colors)

return vim.tbl_extend("force", {
	BufferlineRun = { fg = colors.color4, bg = darken(colors.color4, colors.black, 0.15) },
	BufferlineSplit = { fg = colors.color2, bg = darken(colors.color2, colors.black, 0.15) },
	BufferlineTheme = { fg = colors.color5, bg = darken(colors.color5, colors.black, 0.15) },
	BUfferlineTrasparency = { fg = colors.color6, bg = darken(colors.color6, colors.black, 0.15) },
	BufferlineCloseAll = { fg = colors.color9, bg = darken(colors.color9, colors.black, 0.15) },

	BufferLineBackground = { fg = colors.color7, bg = colors.color0 },
	BufferLineBuffer = { fg = colors.color7, bg = colors.color0 },
	BufferLineBufferSelected = { fg = colors.background, bg = colors.color4, bold = true },
	BufferLineBufferVisible = { fg = colors.color4, bg = colors.color0 },
	BufferLineCloseButton = { fg = colors.color1, bg = colors.color0 },
	BufferLineCloseButtonSelected = { fg = colors.background, bg = colors.color4 },
	BufferLineCloseButtonVisible = { fg = colors.color1, bg = colors.color0 },
	BufferLineDuplicate = { fg = colors.color8, bg = colors.color0 },
	BufferLineDuplicateSelected = { fg = colors.color8, bg = colors.color0 },
	BufferLineDuplicateVisible = { fg = colors.color8, bg = colors.color0 },
	BufferLineFill = { fg = colors.color7, bg = colors.background },
	BufferLineIndicatorSelected = { fg = colors.color4, bg = colors.color4 },
	BufferLineIndicatorVisible = { fg = colors.color0, bg = colors.color0 },
	BufferLineModified = { fg = colors.color2, bg = colors.color0 },
	BufferLineModifiedSelected = { fg = colors.background, bg = colors.color4 },
	BufferLineModifiedVisible = { fg = colors.color2, bg = colors.color0 },
	BufferLineOffsetSeparator = { fg = colors.color4, bg = colors.color4 },
	BufferLinePick = { fg = colors.color13, bg = colors.color0, bold = true },
	BufferLinePickSelected = { fg = colors.color11, bg = colors.color4, bold = true },
	BufferLinePickVisible = { fg = colors.color11, bg = colors.color0, bold = true },
	BufferLineSeparator = { fg = colors.color0, bg = colors.color0 },
	BufferLineSeparatorSelected = { fg = colors.color4, bg = colors.color4 },
	BufferLineSeparatorVisible = { fg = colors.color0, bg = colors.color0 },
	BufferLineTabClose = { fg = colors.color1, bg = colors.background },
	BufferLineTab = { fg = colors.color7, bg = colors.color0 },
	BufferLineTabSelected = { fg = colors.color4, bg = colors.background, bold = true },
	BufferLineTabSeparator = { fg = colors.color0, bg = colors.color0 },
	BufferLineTabSeparatorSelected = { fg = colors.background, bg = colors.background },
}, icon_styles)
