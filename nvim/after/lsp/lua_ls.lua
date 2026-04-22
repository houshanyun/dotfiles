-- 這裡回傳的 table 會自動被 Nvim 0.11+ 的 LSP 系統讀取並合併
return {
  settings = {
    Lua = {
      runtime = {
        -- 告訴伺服器你正在使用的是 LuaJIT (Neovim 內建)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- 核心：讓 LSP 認識 'vim' 這個全局變量，不再發出警告
        globals = { 'vim' },
      },
      workspace = {
        -- 讓 LSP 讀取 Neovim 的執行環境路徑，提供完整的內建 API 補全
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- 關閉惱人的第三方庫偵測提示
      },
      telemetry = {
        enable = false,
      },
    },
  },
  print("LOADED lua_ls config")

}
