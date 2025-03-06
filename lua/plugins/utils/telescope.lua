return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope", "Tel" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [F]iles" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "[F]ind [G]it Files" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "[F]ind [R]ecent Files" },
		{ "<leader>fn", "<cmd>enew<cr>", desc = "[F]ile [N]ew" },

		{ "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "[F]ind [W]ord" },
		{ "<leader>fW", "<cmd>Telescope grep_string<cr>", desc = "[F]ind Current [W]ord" },

		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[F]ind [B]uffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "[F]ind [H]elp" },
		{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "[F]ind [M]arks" },
		{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "[F]ind [C]ommands" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[F]ind [K]eymaps" },

		{ "<leader>fa", "<cmd>Telescope autocommands<cr>", desc = "[F]ind [A]utocommands" },
		{ "<leader>fs", "<cmd>Telescope persisted<cr>", desc = "[F]ind [S]essions" },
		{ "<leader>fp", "<cmd>Telescope projects<cr>", desc = "[F]ind [P]rojects" },
		{ "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "[F]ind [H]ighlights" },
		{ "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "[F]ind [M]an Pages" },
	},
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = false },
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = {
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					preview_width = 0.55,
					results_width = 0.8,
					prompt_position = "bottom",
				},
				vertical = { width = 0.9, height = 0.95 },
				width = 0.69,
				height = 0.75,
				preview_cutoff = 120,
			},

			file_ignore_patterns = {
				"%.git/",
				"node_modules/",
				"%.cache/",
				"%.class",
				"%.pdf",
				"%.mkv",
				"%.mp4",
			},
			path_display = { "truncate" },
			sorting_strategy = "ascending",
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

			prompt_prefix = "   ",
			selection_caret = "  ",
			entry_prefix = "  ",
			color_devicons = true,
			winblend = 0,

			find_command = {
				"rg",
				"--hidden",
				"--glob=!**/.git/*",
				"--glob=!**/node_modules/*",
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		opts.defaults.mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<C-s>"] = actions.select_horizontal,
				["<C-d>"] = actions.preview_scrolling_down,
				["<C-u>"] = actions.preview_scrolling_up,
			},
			n = {
				["<esc>"] = actions.close,
				["q"] = actions.close,
			},
		}

		opts.extensions = {
			["ui-select"] = require("telescope.themes").get_dropdown(),
			file_browser = {
				theme = "ivy",
				hijack_netrw = true,
				hidden = { file_browser = true, folder_browser = true },
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		}

		telescope.setup(opts)

		-- Load extensions
		for _, ext in ipairs({ "ui-select", "fzf" }) do
			pcall(telescope.load_extension, ext)
		end
	end,
}
