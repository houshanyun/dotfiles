-- ~/.config/nvim/lua/plugins/luasnip.lua
return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local ls = require("luasnip")

    -- 1. 設定基礎選項
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

    -- 2. 強制關聯：確保 tsx 檔案能抓到 react-native 的片段
    -- 這是為了解決你輸入 print 出現 {} 的問題
    ls.filetype_extend("typescriptreact", { "javascript", "react", "react-native" })

    -- 3. 【關鍵】顯式載入 vscode 格式的 snippets
    -- 如果你的 friendly-snippets 安裝在標準位置，這行會把它們全部讀進來
    require("luasnip.loaders.from_vscode").lazy_load()

    -- 4. 為了排錯，你可以加上這行，手動指定路徑（可選）
    -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("data") .. "/lazy/friendly-snippets" } })
  end,
}
