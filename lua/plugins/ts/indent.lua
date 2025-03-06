return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" }, -- Load after buffer initialization
  dependencies = {
    "nvim-treesitter/nvim-treesitter",     -- For advanced scope detection
  },
  keys = {
    { "<leader>ti", "<cmd>IBLToggle<cr>", desc = "[T]oggle [I]ndent Lines" },
  },
  opts = {
    -- Base indentation configuration
    indent = {
      char = "│", -- Light vertical bar character
      highlight = "IblIndent", -- Custom highlight group
      priority = 1, -- Lower than scope priority
    },

    -- Scope highlighting configuration
    scope = {
      enabled = true, -- Enable scope highlighting
      char = "▏", -- Thinner vertical bar
      highlight = "IblScope", -- Custom highlight group
      priority = 2, -- Higher than indent priority
      show_start = true, -- Show scope start line
      show_end = true, -- Show scope end line
    },

    -- Exclude specific filetypes
    exclude = {
      filetypes = {
        "help",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "txt",
        "markdown",
        "NvimTree",
      },
    },

    -- Character customization
    whitespace = {
      remove_blankline_trail = true, -- Clean trailing whitespace
    },
  },
  config = function(_, opts)
    -- Register hooks
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

    -- Setup with options
    require("ibl").setup(opts)
  end,
}
