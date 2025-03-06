local theme = require("themer")
local blend = require("themer.colors").blend

local colors = theme and theme.get_theme_table and theme.get_theme_table("theme")
local M = {}

local function configure_general()
	local general_highlights = {
		"Normal",
		"NormalFloat",
		"WinBar",
		"WinBarNC",
		"Folded",
		"FoldColumn",
		"LineNr",
		"CursorColumn",
		"ColorColumn",
		"SignColumn",
		"CursorLine",
		"MsgArea",
		"NvimTreeLineNr",
	}

	for _, hl in ipairs(general_highlights) do
		M[hl] = { bg = "NONE" }
	end

	M.NormalFloatBorder = { fg = blend(colors.color7, colors.black, 0.3) }
	M.WinSeparator = {
		fg = blend(colors.foreground, colors.black, 0.3),
		bg = "NONE",
	}
end

local function configure_telescope()
	local telescope_highlights = {
		"TelescopeNormal",
		"TelescopePrompt",
		"TelescopeBorder",
		"TelescopeResults",
		"TelescopePromptNormal",
		"TelescopePromptPrefix",
	}

	for _, hl in ipairs(telescope_highlights) do
		M[hl] = { bg = "NONE" }
	end

	local blended_fg = blend(colors.color7, colors.black, 0.2)
	M.TelescopeBorder = { fg = blended_fg, bg = "NONE" }
	M.TelescopePromptBorder = { fg = blended_fg, bg = "NONE" }
	M.TelescopePreviewBorder = { fg = blended_fg, bg = "NONE" }
	M.TelescopeResultsBorder = { fg = blended_fg, bg = "NONE" }
	M.TelescopeNormalBorder = { fg = blended_fg, bg = "NONE" }
	M.TelescopeSelection = { bg = blend(colors.color4, colors.black, 0.08) }
end

local function configure_whichkey()
	local whichkey_highlights = {
		"WhichKey",
		"WhichKeyGroup",
		"WhichKeyDesc",
		"WhichKeyFloat",
	}

	for _, hl in ipairs(whichkey_highlights) do
		M[hl] = { bg = "NONE" }
	end
end

local function configure_cmp()
	local cmp_highlights = {
		"CmpNormal",
		"CmpItemAbbr",
		"CmpItemAbbrDeprecated",
		"CmpItemMenu",
		"CmpPmenu",
	}

	for _, hl in ipairs(cmp_highlights) do
		M[hl] = { bg = "NONE" }
	end

	M.CmpItemAbbrMatch = {
		bg = "NONE",
		bold = true,
	}
end

local function configure_noice()
	local noice_highlights = {
		"NoiceMini",
		"NoiceCmdlinePopup",
		"NoiceCmdlinePopupBorder",
		"NoiceCmdlinePopupBorderSearch",
		"NoiceCmdlinePopupTitle",
		"NotifyBackground",
		"NotifyINFOBorder",
		"NotifyWARNBorder",
		"NotifyERRORBorder",
		"NotifyDEBUGBorder",
		"NotifyTRACEBorder",
		"NotifyLogTime",
		"NotifyERRORIcon",
		"NotifyWARNIcon",
		"NotifyINFOIcon",
		"NotifyDEBUGIcon",
		"NotifyTRACEIcon",
		"NotifyERRORTitle",
		"NotifyWARNTitle",
		"NotifyINFOTitle",
		"NotifyDEBUGTitle",
		"NotifyTRACETitle",
		"NotifyERRORBody",
		"NotifyWARNBody",
		"NotifyINFOBody",
		"NotifyDEBUGBody",
		"NotifyTRACEBody",
	}

	for _, hl in ipairs(noice_highlights) do
		M[hl] = { bg = "NONE" }
	end
	M.NotifyINFOBorder = { fg = blend(colors.color4, colors.black, 0.25), bg = "NONE" }
	M.NotifyWARNBorder = { fg = blend(colors.color3, colors.black, 0.25), bg = "NONE" }
	M.NotifyERRORBorder = { fg = blend(colors.color1, colors.black, 0.25), bg = "NONE" }
	M.NotifyDEBUGBorder = { fg = blend(colors.color5, colors.black, 0.25), bg = "NONE" }
	M.NotifyTRACEBorder = { fg = blend(colors.color2, colors.black, 0.25), bg = "NONE" }
end

local function configure_miscellaneous()
	M.TreesitterContext = { bg = "NONE" }
	M.NvimTreeNormal = { bg = "NONE" }
	M.NvimTreeNormalNC = { bg = "NONE" }
	M.SagaNormal = { bg = "NONE" }
	M.SagaBorder = { bg = "NONE" }
	M.RenameNormal = { bg = "NONE" }
	M.RenameBorder = { bg = "NONE" }
	M.AlphaHeader = { bg = "NONE" }
	M.AlphaMessage = { bg = "NONE" }
	M.AlphaLabel = { bg = "NONE" }
	M.AlphaIcon = { bg = "NONE" }
	M.AlphaFooter = { bg = "NONE" }
	M.NvimTreeWinSeparator = { bg = "NONE" }

	local blended_fg = blend(colors.color7, colors.black, 0.2)
	M.CmpBorder = { fg = blended_fg, bg = "NONE" }
	M.CmpDocBorder = { fg = blended_fg, bg = "NONE" }
	M.NoiceCmdlinePopupBorder = { fg = blended_fg, bg = "NONE" }
	M.NvimTreeWinSeparator = { fg = blended_fg, bg = "NONE" }
	M.LineNr = { fg = blended_fg, bg = "NONE" }
	M.CursorColumn = { bg = blend(colors.color4, colors.black, 0.08) }
end

-- Run all configuration
configure_general()
configure_telescope()
configure_whichkey()
configure_cmp()
configure_noice()
configure_miscellaneous()

return M
