return {
	"stevearc/conform.nvim",
	event = "BufWritePre", -- Auto-format on save
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format()
			end,
			desc = "[C]ode [F]ormat",
		},
	},
	opts = {
		-- Filetype-to-formatters mapping
		formatters_by_ft = {
			lua = { "stylua" },
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			c_sharp = { "csharpier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "mdformat" },
			python = { "black" },
			rust = { "rustfmt" },
			proto = { "prettier" },
			java = { "prettier" },
			latex = { "latexindent" },
			cpp = { "clang-format" },
			c = { "clang-format" },
		},

		-- Format-on-save configuration
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
			async = false,
		},

		-- Formatter configurations
		formatters = {
			prettier = {
				prepend_args = { "--prose-wrap", "always" },
			},
			clang_format = {
				-- Automatically find project root using .clang-format or CMakeLists.txt
				cwd = function(ctx)
					return require("conform").get_root(ctx, {
						root_files = { ".clang-format", ".clang-format.json", "CMakeLists.txt" },
					})
				end,
			},
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		-- Optional: Format diagnostics
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
