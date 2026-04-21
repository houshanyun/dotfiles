return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section belowpreset = "modern", -- 現代化 UI 風格
    win = {
      border = "rounded", -- 圓角邊框，搭配你的 Arch Linux 環境更好看
      padding = { 1, 2 }, -- 增加一點內距
    },
    layout = {
      align = "center", -- 居中對齊
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
