return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- 加上 prettier 作為備援，並統一加上 stop_after_first
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true
    },
    -- 這裡是非常重要的修改：強制 Prettier 即使沒有設定檔也要執行
    formatters = {
      prettierd = {
        -- 讓 prettierd 不強制要求專案目錄必須有設定檔
        env = {
          PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/.prettierrc.json"), -- 指向一個全域路徑（選配）
        },
      },
      prettier = {
        -- 核心修正：讓原生 prettier 在找不到設定檔時不報錯
        args = { "--stdin-filepath", "$FILENAME", "--require-config", "false" },
      },
    },
  },
}
