vim.g.mapleader = " " -- 設置空格鍵為 Leader Key

local keymap = vim.keymap
-- keymap.set("n", "<leader>e", ":Ex <CR>")         -- 打開內置文件瀏覽器

keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "跳轉到導航定義" })
keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "顯示導航參數類型" })
keymap.set('n', "<C-o>", ":NvimTreeToggle<CR>", { desc = "打開側邊攔" })

keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "取消搜尋高亮" })
-- 使用 <Leader> + e 來跳出錯誤訊息視窗
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "顯示浮動診斷訊息" })

-- 跳轉到上一個/下一個錯誤（這通常會搭配 open_float 使用）
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "上一個診斷訊息" })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "下一個診斷訊息" })


vim.keymap.set('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "切換 Inlay Hints" })
