return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false, -- 官方明確要求不要 lazy-load
  build = ':TSUpdate',
  config = function()
    -- 新版調用方式
    require('nvim-treesitter').setup({
      -- 解析器安裝路徑 (選填，預設會存在 data 目錄)
      install_dir = vim.fn.stdpath('data') .. '/site'
    })

    -- 2. 手動指定要安裝的語言 (針對 React 開發)
    -- 這會非同步安裝，不會卡住啟動
    require('nvim-treesitter').install({
      "tsx",
      "typescript",
      "javascript",
      "html",
      "css",
      "json",
      "yaml",
      "lua",
      "vim",
      "vimdoc",
      "markdown",
      "markdown_inline"
    })
  end,
  highlight = {
    enable = true, -- 這行就代替了你的第一個 autocmd
  },
  indent = {
    enable = true, -- 這行就代替了你的第三個 autocmd
  },
}
