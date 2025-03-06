return {
	"nvim-tree/nvim-tree.lua",
	version = "*", -- Use the latest version
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Optional, for file icons
	},
	keys = {
		{ "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Tree" },
		{ "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "Focus File Tree" },
		{ "<leader>cd", '<cmd>lua vim.cmd("cd %:p:h | pwd")<cr>', desc = "[C]hange [D]irectory" },
	},
	opts = {
		-- Tree appearance
		view = {
			width = 30,
			side = "left",
			number = false,
			relativenumber = false,
			signcolumn = "yes",
			float = {
				enable = false, -- If you want it to be floating, put `true`
			},
		},

		-- Rendering and styles
		renderer = {
			root_folder_label = false,
			indent_markers = {
				enable = true,
			},
			icons = {
				glyphs = {
					default = " ",
					symlink = " ",
					git = {
						deleted = " ",
						unstaged = " ",
						untracked = " ",
						staged = " ",
						unmerged = " ",
					},
				},
				show = {
					git = true,
					folder = true,
					file = true,
					folder_arrow = false,
				},
			},
		},

		-- File management
		actions = {
			open_file = {
				window_picker = {
					exclude = {
						filetype = { "packer", "qf" },
						buftype = { "terminal", "help" },
					},
				},
				quit_on_open = false,
			},
			change_dir = {
				global = true,
			},
		},

		-- File filtering
		filters = {
			dotfiles = false,
			custom = { "^.git$", "node_modules", ".cache" },
		},

		-- Integration with git
		git = {
			enable = true,
			ignore = false,
			timeout = 400,
		},

		-- Self-closing behaviour
		hijack_directories = {
			enable = false,
			auto_open = false,
		},

		-- Update the tree
		update_focused_file = {
			enable = false,
			update_root = true,
			ignore_list = {},
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)

		-- Auto-close tree if it is the only window open
		vim.api.nvim_create_autocmd("BufEnter", {
			nested = true,
			callback = function()
				local api = require("nvim-tree.api")
				if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
					vim.cmd("quit")
				end
			end,
		})
	end,
}
