local colors = require("themer").get_theme_table("theme")

return {
	NvimTreeEmptyFolderName = { fg = colors.color4 },
	NvimTreeEndOfBuffer = { fg = colors.darker },
	NvimTreeFolderIcon = { fg = colors.color11 },
	NvimTreeFolderName = { fg = colors.color4 },
	NvimTreeFolderArrowOpen = { fg = colors.color4 },
	NvimTreeFolderArrowClosed = { fg = colors.comment },
	NvimTreeGitDirty = { fg = colors.color11 },
	NvimTreeIndentMarker = { fg = colors.color8 },
	NvimTreeNormal = { bg = colors.darker },
	NvimTreeNormalNC = { bg = colors.darker },
	NvimTreeOpenedFolderName = { fg = colors.color4 },
	NvimTreeGitIgnored = { fg = colors.comment },
	NvimTreeDiagnosticErrorFileHL = { link = "DiagnosticError" },
	NvimTreeDiagnosticErrorFolderHL = { link = "DiagnosticError" },
	NvimTreeDiagnosticInfoFileHL = { link = "DiagnosticNormal" },
	NvimTreeDiagnosticInfoFolderHL = { link = "DiagnosticNormal" },
	NvimTreeDiagnosticWarnFileHL = { link = "DiagnosticWarn" },
	NvimTreeDiagnosticWarnFolderHL = { link = "DiagnosticWarn" },
	NvimTreeDiagnosticHintFileHL = { link = "DiagnosticHint" },
	NvimTreeDiagnosticHintFolderHL = { link = "DiagnosticHint" },

	NvimTreeWinSeparator = {
		fg = colors.darker,
		bg = colors.darker,
	},

	NvimTreeWindowPicker = {
		fg = colors.color1,
		bg = colors.color0,
	},

	NvimTreeCursorLine = {
		bg = colors.black,
	},

	NvimTreeGitNew = {
		fg = colors.color2,
	},

	NvimTreeGitDeleted = {
		fg = colors.color1,
	},

	NvimTreeSpecialFile = {
		fg = colors.color3,
		bold = true,
	},

	NvimTreeRootFolder = {
		fg = colors.color1,
		bold = true,
	},
}
