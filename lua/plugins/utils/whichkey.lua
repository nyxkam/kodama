return {
	"folke/which-key.nvim",
	event = "VeryLazy", -- Load on first keypress
	opts = {
		-- General configuration
		plugins = {
			marks = true, -- Show marks
			registers = true, -- Show registers
			spelling = {
				enabled = true, -- Enable spelling suggestions
				suggestions = 20, -- Number of suggestions
			},
			presets = {
				operators = true, -- Enable operator mappings
				motions = true, -- Enable motion mappings
				text_objects = true, -- Enable text object mappings
				windows = true, -- Enable window mappings
				nav = true, -- Enable navigation mappings
				z = true, -- Enable fold mappings
				g = true, -- Enable git mappings
			},
		},

		-- Layout configuration
		layout = {
			height = { min = 4, max = 25 }, -- Height constraints
			width = { min = 20, max = 50 }, -- Width constraints
			spacing = 3, -- Spacing between items
			align = "left", -- Alignment of items
		},

		-- Visual configuration
		icons = {
			breadcrumb = "»", -- Separator symbol
			separator = "➜", -- Key separator
			group = "+", -- Group indicator
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Register key mappings (new spec format)
		wk.add({
			{ "<leader>f", group = "file" },
		})

		-- Setup automatic documentation
		vim.o.timeout = true
		vim.o.timeoutlen = 300 -- Time before showing popup
	end,
}
