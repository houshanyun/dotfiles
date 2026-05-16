return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    float = {
      -- Padding around the floating window
      padding = 2,
      -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      max_width = 80,
      max_height = 0,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
    keymaps = {
      -- ["-"] = "actions.parent",
      ["<BS>"] = "actions.parent",
    },
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  keys = {
    { "-", "<cmd>Oil --float<cr>", desc = "Open Oil in floating window" },
  },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
