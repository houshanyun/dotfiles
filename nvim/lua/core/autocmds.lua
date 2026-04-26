-- 1. 诊断设定
-- vim.diagnostic.config({
--   virtual_text = false,
--   signs = {
--     text = {
--       -- diagnostics 图示
--       [vim.diagnostic.severity.ERROR] = "✘ ",
--       [vim.diagnostic.severity.WARN]  = "▲ ",
--       [vim.diagnostic.severity.INFO]  = "ℹ ",
--       [vim.diagnostic.severity.HINT]  = "⚑ ",
--     },
--   },
--   underline = true,
--   severity_sort = true,
--   float = {
--     border = "rounded",
--   },
-- })
-- 2. LSP 附着事件
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function(ev)
--     vim.api.nvim_create_autocmd("CursorHold", {
--       buffer = ev.buf,
--       callback = function()
--         local opts = {
--           focusable = true,
--           close_events = { "CursorMoved", "CursorMovedI", "BufLeave" },
--           focus = false,
--           source = "always",
--         }
--         vim.diagnostic.open_float(nil, opts)
--       end
--     })
--   end
-- })

-- 3. Yank 通知 + 高亮
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    local event = vim.v.event
    local count = #event.regcontents
    local msg = string.format("Yanked %d line%s", count, count > 1 and "s" or "")
    vim.notify(msg, vim.log.levels.INFO)
  end,
})
