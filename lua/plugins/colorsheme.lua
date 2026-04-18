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
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', },
    opts = {
      theme = "solarized-osaka",
    },
  },
}
