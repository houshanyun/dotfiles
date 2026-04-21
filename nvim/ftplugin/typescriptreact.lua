-- 1. 編輯器基本選項 (Buffer Local)
-- 使用 opt_local 確保這些設定只影響 TSX 檔案，不會污染其他檔案
vim.opt_local.shiftwidth = 2               -- 設定縮排為 2 格 (React 標準)
vim.opt_local.tabstop = 2                  -- 設定 Tab 顯示為 2 格
vim.opt_local.expandtab = true             -- 將 Tab 轉為空格
vim.opt_local.commentstring = "{/* %s */}" -- 設定註解格式，方便在 TSX 標籤內註解

-- 2. 代碼摺疊 (Treesitter 驅動)
-- 讓你可以用 zc/zo 快速收合 React 元件或長長的 Tailwind Class
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt_local.foldlevel = 99 -- 預設不折疊，保持開啟狀態

-- 3. 語言專屬快捷鍵 (Buffer Local)
-- 這裡設定的快捷鍵只會在 TSX 檔案中生效
local opts = { buffer = true, silent = true }

-- 快速開發工具
vim.keymap.set('n', '<leader>re', '<cmd>!npx expo start<cr>',
  { buffer = true, desc = "React: Start Expo Server" })

vim.keymap.set('n', '<leader>ri', '<cmd>!npm install<cr>',
  { buffer = true, desc = "React: Install Packages" })

-- 4. NativeWind / Tailwind 輔助 (選配)
-- 如果你有裝相關插件，可以切換隱藏長長的 class 內容
vim.keymap.set('n', '<leader>tw', '<cmd>TailwindConcealToggle<cr>',
  { buffer = true, desc = "Tailwind: Toggle Conceal" })

-- 5. 自動指令 (Autocmd)
-- 儲存時自動修正並格式化 (如果你想在特定語言才自動格式化)
vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = 0,
  callback = function()
    -- 這裡呼叫你已經裝好的 conform.lua
    require("conform").format({ bufnr = 0, lsp_fallback = true })
  end,
})
