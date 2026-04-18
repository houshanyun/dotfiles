return {
  "neovim/nvim-lspconfig", -- 只是提供 server 設定資料
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },

  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        --"ts_ls",
        "vtsls",
        "tailwindcss",
        "jsonls",
      },
    })

    -- 🔥 blink-cmp
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local on_attach = function(_, bufnr)
      local map = function(keys, func)
        vim.keymap.set("n", keys, func, { buffer = bufnr })
      end

      map("gd", vim.lsp.buf.definition)
      map("K", vim.lsp.buf.hover)
      map("<leader>rn", vim.lsp.buf.rename)
    end

    -- ✅ 新 API（重點）
    local servers = { "lua_ls", "vtsls", "jsonls", "tailwindcss" }

    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.enable(server)
    end

    -- ✅ Lua 特別處理
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
}
