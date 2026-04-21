return {
  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    severity_sort = true, -- 讓重要的錯誤排在前面
    float = {
      border = "rounded",
    },
  }),
  -- 2. 建立一個全域的 LSP 附著事件
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- 設定當游標停在錯誤上時，自動跳出浮動視窗
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = ev.buf, -- 只對目前這個有 LSP 的檔案生效
        callback = function()
          local opts = {
            focusable = true,
            close_events = { "CursorMoved", "CursorMovedI", "BufLeave" },
            focus = false,
            source = "always",
          }
          vim.diagnostic.open_float(nil, opts)
        end
      })
    end
  })
}
