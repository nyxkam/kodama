return {
  "sindrets/diffview.nvim",
  cmd = { -- Lazy-load on these commands
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
  },
  keys = { -- Suggested key mappings
    { "<leader>gd", "<cmd>DiffviewOpen<cr>",        desc = "[G]it [D]iff View" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "[G]it [H]istory" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",       -- Required dependency
    "nvim-tree/nvim-web-devicons", -- For file icons
    {
      "tpope/vim-fugitive",
      cmd = "Git",
      keys = {
        { "<leader>gc", "<cmd>DiffviewClose<cr>",   desc = "Close Diff View" },
        { "<leader>gr", "<cmd>DiffviewRefresh<cr>", desc = "Refresh Diffs" },
      },
    },
  },
  opts = {
    -- View configuration
    view = {
      merge_tool = {
        layout = "diff3_mixed", -- Available: diff3_mixed, diff3_horizontal
      },
    },

    -- File history options
    file_history = {
      log_options = {
        single_file = { diff_merges = "combined" },
        multi_file = { diff_merges = "first-parent" },
      },
    },

    -- Default enhancement options
    enhanced_diff_hl = true, -- Better diff highlighting
    show_help_hints = false, -- Disable help hints in buffers
    use_icons = true,        -- Use devicons
    icons = {
      folder_closed = "",
      folder_open = "",
    },
  },
  config = function(_, opts)
    local diffview = require("diffview")

    -- Initialize with configuration
    diffview.setup(opts)
  end,
}
