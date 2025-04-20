return {
	"neovim/nvim-lspconfig",
	dependencies = { "MunifTanjim/nui.nvim" },
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
	config = function()
		local lspconfig = require("lspconfig")
		local signature = require("plugins.lsp.extra.signature")
		local map = vim.keymap.set

		local M = {}

		M.on_init = function(client, _)
			if client.supports_method("textDocument/semanticTokens") then
				client.server_capabilities.semanticTokensProvider = nil
			end
		end

		M.on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = true
			client.server_capabilities.documentRangeFormattingProvider = true
			signature.setup(client, bufnr)
			local function opts(desc)
				return { buffer = bufnr, desc = "LSP " .. desc }
			end

			local mappings = {
				{ "n", "K", vim.lsp.buf.hover, "Hover" },
				{ "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
				{ "n", "gd", vim.lsp.buf.definition, "Go to definition" },
				{ "n", "gi", vim.lsp.buf.implementation, "Go to implementation" },
				{ "n", "<leader>sh", vim.lsp.buf.signature_help, "Show signature help" },
				{ "n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
				{ "n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
				{
					"n",
					"<leader>wl",
					function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end,
					"List workspace folders",
				},
				{ "n", "<leader>D", vim.lsp.buf.type_definition, "Go to type definition" },
				{ "n", "<leader>ra", require("plugins.lsp.extra.renamer").lsp_rename, "Renamer" },
				{ { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action" },
				{ "n", "gr", vim.lsp.buf.references, "Show references" },
			}

			for _, m in ipairs(mappings) do
				map(m[1], m[2], m[3], opts(m[4]))
			end
		end

		M.capabilities = vim.lsp.protocol.make_client_capabilities()

		M.capabilities.textDocument.completion.completionItem = {
			documentationFormat = { "markdown", "plaintext" },
			snippetSupport = true,
			preselectSupport = true,
			insertReplaceSupport = true,
			labelDetailsSupport = true,
			deprecatedSupport = true,
			commitCharactersSupport = true,
			tagSupport = { valueSet = { 1 } },
			resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			},
		}

		vim.diagnostic.config({
			virtual_text = false,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			signs = { text = { [1] = " ", [2] = " ", [3] = " ", [4] = "󰌵" } },
			float = {
				suffix = "",
				header = { "  Diagnostics", "String" },
				prefix = function(_, _, _)
					return " 󰶻 ", "String"
				end,
			},
		})

		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		local function custom_open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = vim.g.transparency and "rounded" or "solid"
			table.insert(contents, 1, " ")
			table.insert(contents, " ")
			for i, line in ipairs(contents) do
				contents[i] = "  " .. line .. "  "
			end

			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end
		vim.lsp.util.open_floating_preview = custom_open_floating_preview

		local servers = {
			"jdtls",
			"html",
			"pyright",
			"ts_ls",
			"clangd",
			"cssls",
			"texlab",
			"jsonls",
			"tailwindcss",
			"yamlls",
			"texlab",
			"marksman",
		}

		for _, k in ipairs(servers) do
			lspconfig[k].setup({
				on_attach = M.on_attach,
				on_init = M.on_init,
				capabilities = M.capabilities,
			})
		end

		lspconfig.lua_ls.setup({
			on_attach = M.on_attach,
			on_init = M.on_init,
			capabilities = M.capabilities,

			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
					},
				},
			},
		})

		lspconfig.emmet_ls.setup({
			on_attach = M.on_attach,
			capabilities = M.capabilities,
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
				"php",
				"twig",
			},
			initialize_options = {
				html = {
					options = {
						["bem.enabled"] = true,
					},
				},
				php = {
					options = {
						["bem.enabled"] = true,
					},
				},
			},
		})

		lspconfig.intelephense.setup({
			on_attach = M.on_attach,
			capabilities = M.capabilities,
			cmd = { "intelephense", "--stdio" },
			root_dir = lspconfig.util.root_pattern("composer.json", ".git", "index.php", "public"),
			filetypes = { "php" },
		})

		lspconfig.omnisharp.setup({
			on_attach = M.on_attach,
			capabilities = M.capabilities,
			enable_import_completion = true,
			organize_imports_on_format = true,
			enable_roslyn_analyzers = true,
			settings = {
				FormattingOptions = {
					EnableEditorConfigSupport = true,
				},
			},
			cmd = { "omnisharp" },
			root_dir = function(fname)
				return lspconfig.util.root_pattern("*.sln", "*.csproj")(fname) or vim.fn.getcwd()
			end,
		})

		lspconfig.sqlls.setup({
			on_attach = M.on_attach,
			capabilities = M.capabilities,
			filetypes = { "sql", "mysql" },
			root_dir = function()
				return vim.fn.getcwd()
			end,
			settings = {
				sqlLanguageServer = {
					connections = {
						{
							driver = "mysql",
							dataSourceName = "root:password@tcp(localhost:3306)/phpmyadmin",
						},
					},
				},
			},
		})
		return M
	end,
}
