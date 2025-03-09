local colors = require("themer").get_theme_table("theme")

return {
	-- Dap
	DapBreakpoint = { fg = colors.color1 }, -- BF616A
	DapBreakpointCondition = { fg = colors.color3 }, -- D08F70
	DapLogPoint = { fg = colors.color6 }, -- 88C0D0
	DapStopped = { fg = colors.color5 }, -- B988B0

	-- DapUI
	DAPUIScope = { fg = colors.color6 }, -- 88C0D0
	DAPUIType = { fg = colors.color13 }, -- B48EAD
	DAPUIValue = { fg = colors.color6 }, -- 88C0D0
	DAPUIVariable = { fg = colors.color7 }, -- bac1d0
	DapUIModifiedValue = { fg = colors.color3 }, -- D08F70
	DapUIDecoration = { fg = colors.color6 }, -- 88C0D0
	DapUIThread = { fg = colors.color2 }, -- A3BE8C
	DapUIStoppedThread = { fg = colors.color6 }, -- 88C0D0
	DapUISource = { fg = colors.color5 }, -- B988B0
	DapUILineNumber = { fg = colors.color6 }, -- 88C0D0
	DapUIFloatBorder = { fg = colors.color6 }, -- 88C0D0

	DapUIWatchesEmpty = { fg = colors.color5 }, -- B988B0
	DapUIWatchesValue = { fg = colors.color2 }, -- A3BE8C
	DapUIWatchesError = { fg = colors.color5 }, -- B988B0

	DapUIBreakpointsPath = { fg = colors.color6 }, -- 88C0D0
	DapUIBreakpointsInfo = { fg = colors.color2 }, -- A3BE8C
	DapUIBreakPointsCurrentLine = { fg = colors.color2, bold = true }, -- A3BE8C
	DapUIBreakpointsDisabledLine = { fg = colors.color8 }, -- 2d3139

	DapUIStepOver = { fg = colors.color4 }, -- 81A1C1
	DapUIStepOverNC = { fg = colors.color4 }, -- 81A1C1
	DapUIStepInto = { fg = colors.color4 }, -- 81A1C1
	DapUIStepIntoNC = { fg = colors.color4 }, -- 81A1C1
	DapUIStepBack = { fg = colors.color4 }, -- 81A1C1
	DapUIStepBackNC = { fg = colors.color4 }, -- 81A1C1
	DapUIStepOut = { fg = colors.color4 }, -- 81A1C1
	DapUIStepOutNC = { fg = colors.color4 }, -- 81A1C1
	DapUIStop = { fg = colors.color1 }, -- BF616A
	DapUIStopNC = { fg = colors.color1 }, -- BF616A
	DapUIPlayPause = { fg = colors.color2 }, -- A3BE8C
	DapUIPlayPauseNC = { fg = colors.color2 }, -- A3BE8C
	DapUIRestart = { fg = colors.color2 }, -- A3BE8C
	DapUIRestartNC = { fg = colors.color2 }, -- A3BE8C
	DapUIUnavailable = { fg = colors.color8 }, -- 2d3139
	DapUIUnavailableNC = { fg = colors.color8 }, -- 2d3139
}
