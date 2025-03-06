return {
	"akinsho/toggleterm.nvim",
	version = "*", -- Use the latest version
	cmd = { "ToggleTerm", "TermExec" }, -- Lazy-load on these commands
	keys = {
		{ "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "[T]oggle [T]erminal (float)" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "[T]oggle [T]erminal (horizontal)" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "[T]oggle [T]erminal (vertical)" },
	},
	opts = {
		-- Terminal behavior
		size = function(term)
			if term.direction == "horizontal" then
				return math.floor(vim.o.lines * 0.4) -- 40% of window height
			elseif term.direction == "vertical" then
				return math.floor(vim.o.columns * 0.5) -- 50% of window width
			end
		end,
		open_mapping = [[<c-\>]], -- Default toggle key
		hide_numbers = true, -- Hide line numbers in terminal
		shade_terminals = false, -- Disable terminal shading
		insert_mappings = true, -- Allow insert mode mappings
		persist_size = true, -- Remember terminal size across sessions
		persist_mode = true, -- Remember terminal mode
		close_on_exit = true, -- Close terminal on exit
		autochdir = true, -- Change directory with Neovim
		shell = vim.o.shell, -- Use the system default shell

		-- Terminal appearance
		highlights = {
			NormalFloat = { link = "Normal" }, -- Normal text in floating terminal
			FloatBorder = { link = "FloatBorder" }, -- Border styling for floating terminal
		},
		float_opts = {
			border = "rounded", -- Rounded border for the terminal
			height = math.ceil(vim.o.lines * 0.8), -- 80% of window height for float
			width = math.ceil(vim.o.columns * 0.8), -- 80% of window width for float
			winblend = 0, -- No transparency
		},

		-- Directional configurations
		direction = "horizontal", -- Default terminal direction
		start_in_insert = true, -- Start in insert mode
		auto_scroll = true, -- Auto-scroll on output
	},
	config = function(_, opts)
		-- Setup ToggleTerm with the specified options
		require("toggleterm").setup(opts)

		-- Custom terminal commands
		local Terminal = require("toggleterm.terminal").Terminal

		-- Example: LazyGit terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			dir = "git_dir", -- Set your Git directory here
			direction = "float", -- Floating terminal for LazyGit
			hidden = true, -- Start terminal hidden
			on_open = function(term)
				vim.cmd("startinsert!") -- Start in insert mode
			end,
			on_close = function(term)
				vim.cmd("startinsert!") -- Start in insert mode when closing
			end,
		})

		-- Keymap for LazyGit
		vim.keymap.set("n", "<leader>gg", function()
			lazygit:toggle() -- Toggle LazyGit terminal
		end, { desc = "[G]it [G]UI (LazyGit)" })
	end,
}
