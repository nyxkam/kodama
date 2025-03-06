return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "BufReadPost", -- Load after file is recognized
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- Required for proper parsing
	},
	keys = {
		{ "<leader>rt", "<cmd>RainbowToggle<cr>", desc = "[R]ainbow [T]oggle" },
	},
	opts = function()
		-- Set up rainbow delimiters options
		local rainbow_opts = {
			strategy = {
				[""] = require("rainbow-delimiters").strategy["global"], -- Global strategy for all filetypes
				vim = require("rainbow-delimiters").strategy["local"], -- Local strategy for vimscript
			},

			query = {
				[""] = "rainbow-delimiters", -- Default query
				lua = "rainbow-blocks", -- Lua specific query
				python = "rainbow-parens", -- Python specific query
				javascript = "rainbow-delimiters-react", -- React specific query for JavaScript
			},

			priority = {
				[""] = 110, -- Default priority
				lua = 210, -- Lua priority
				python = 200, -- Python priority
			},

			highlight = {
				"RainbowDelimiterRed", -- Red
				"RainbowDelimiterYellow", -- Yellow
				"RainbowDelimiterBlue", -- Blue
				"RainbowDelimiterOrange", -- Orange
				"RainbowDelimiterGreen", -- Green
				"RainbowDelimiterViolet", -- Violet
				"RainbowDelimiterCyan", -- Cyan
			},

			blacklist = { "latex", "tex" }, -- Filetypes to exclude
			max_file_lines = 3000, -- Max lines for files to avoid performance issues
		}
		return rainbow_opts
	end,
	config = function(_, opts)
		-- Set global options for rainbow delimiters
		vim.g.rainbow_delimiters = opts
	end,
}
