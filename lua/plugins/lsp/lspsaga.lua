return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach", -- Load when LSP attaches to buffer
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- For symbol resolution
		"nvim-tree/nvim-web-devicons", -- For UI icons
	},
	keys = {
		--{ "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Documentation" },
		{ "<leader>e", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
		{ "<leader>a", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
		{ "<leader>o", "<cmd>Lspsaga outline<cr>", desc = "Toggle Outline" },
		{ "<leader>I", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming Calls" },
		{ "<leader>O", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing Calls" },
		{ "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "Smart Rename" },
	},
	opts = {
		-- Lightbulb configuration
		lightbulb = {
			enable = true,
			enable_in_insert = true, -- Show in insert mode
			sign = false, -- Disable sign column icon
			virtual_text = true, -- Show virtual text
			priority = 40, -- Display priority
		},

		-- Symbol navigation in winbar
		symbol_in_winbar = {
			enable = true,
			separator = "  ", -- Nerd Font separator
			hide_keyword = true, -- Hide language keywords
			show_file = true, -- Show file path
			folder_level = 1, -- Directory depth
			color_mode = true, -- Use theme colors
		},

		-- UI customization
		ui = {
			theme = "border", -- Available: border, rounded, arrow
			border = vim.g.transparency and "rounded" or "solid", -- Border style: single, double, rounded, solid, shadow
			winblend = 0, -- Window transparency (0-100)
			expand = "", -- Expand icon
			collaspe = "", -- Collapse icon
			preview = " ", -- Preview icon
			code_action = "󱧣 ", -- Code action icon
			diagnostic = "🐞", -- Diagnostic icon
			hover = " ", -- Hover icon
		},

		-- Advanced configuration
		scroll_preview = {
			scroll_down = "<C-f>", -- Scroll preview down
			scroll_up = "<C-b>", -- Scroll preview up
		},
		definition = {
			edit = "<C-o>", -- Jump to definition in split
		},
	},
	config = function(_, opts)
		require("lspsaga").setup(opts)

		-- Custom hover window mapping
		vim.keymap.set("n", "K", function()
			require("lspsaga.hover"):render_hover_doc()
		end, { silent = true })
	end,
}
