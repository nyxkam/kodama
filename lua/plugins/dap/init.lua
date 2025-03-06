return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},

	keys = function()
		local mappings = {
			{
				"<leader>dc",
				"<cmd>lua require'dap'.continue()<cr>",
				desc = "Continue",
			},
			{
				"<leader>do",
				"<cmd>lua require'dap'.step_over()<cr>",
				desc = "Step Over",
			},
			{
				"<leader>di",
				"<cmd>lua require'dap'.step_into()<cr>",
				desc = "Step Into",
			},
			{
				"<leader>du",
				"<cmd>lua require'dap'.step_out()<cr>",
				desc = "Step Out",
			},
			{
				"<leader>db",
				"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dB",
				"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
				desc = "Set Breakpoint Condition",
			},
			{
				"<leader>dd",
				"<cmd>lua require('plugins.dap.adapters.utils').safe_toggle_dapui()<cr>",
				desc = "Toggle Dap UI",
			},
			{
				"<leader>dl",
				"<cmd>lua require'dap'.run_last()<cr>",
				desc = "Run Last",
			},
		}
		for _, keymap in ipairs(mappings) do
			vim.api.nvim_set_keymap("n", keymap[1], keymap[2], { noremap = true, silent = true, desc = keymap.desc })
		end
	end,

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_virtual_text = require("nvim-dap-virtual-text")

		--Configure DAP UI
		dapui.setup()

		-- Configure DAP Virtual Text
		dap_virtual_text.setup()

		-- Keybindings for nvim-dap
		vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = " ", texthl = "DapStopped", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
		)
		-- Automatically open DAP UI when debuggin sessions
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		--NOTE: Make sure to install the needed files / executables throught mason
		require("plugins.dap.adapters.cpptools")
		require("plugins.dap.adapters.netcoredbg")
		require("plugins.dap.adapters.godot")
		require("plugins.dap.adapters.bash-debug-adapter")
		require("plugins.dap.adapters.php-debug-adapter")
		require("plugins.dap.adapters.dart-debug-adapter")
		require("plugins.dap.adapters.chrome-debug-adapter")
		require("plugins.dap.adapters.firefox-debug-adapter")
		require("plugins.dap.adapters.java-debug")
		require("plugins.dap.adapters.node-debug2")
		require("plugins.dap.adapters.debugpy")
		require("plugins.dap.adapters.go-debug-adapter")
		require("plugins.dap.adapters.js-debug")
	end,
}
