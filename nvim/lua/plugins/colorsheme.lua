return {
  --{"Tsuzat/NeoSolarized.nvim",
  -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --priority = 1000, -- make sure to load this before all the other start plugins
  --opts = {},
  --},
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd [[ colorscheme solarized-osaka ]]
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = "solarized-osaka",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
      },
    },
  },
}
