vim.g.mapleader = " "
require("core.options")
require("core.mappings")
require("core.autocommands")
require("colorify").run()

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("core.lazy")

-- load plugins
require("lazy").setup({
	spec = {
		{ import = "plugins.lsp" },
		{ import = "plugins.comment" },
		{ import = "plugins.git" },
		{ import = "plugins.ts" },
		{ import = "plugins.ui" },
		{ import = "plugins.utils" },
	},
}, lazy_config)
