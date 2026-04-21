vim.g.mapleader = " " -- 設置空格鍵為 Leader Key

local keymap = vim.keymap
-- keymap.set("n", "<leader>e", ":Ex <CR>")         -- 打開內置文件瀏覽器

keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "跳轉到導航定義" })
keymap.set("n", "gr", vim.lsp.buf.references)
keymap.set("n", "gi", vim.lsp.buf.implementation)
keymap.set("n", "gy", vim.lsp.buf.type_definition)
keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "顯示導航參數類型" })
keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)
keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "顯示浮動診斷訊息" })
keymap.set('n', "<C-o>", "<cmd>NvimTreeToggle<CR>", { desc = "打開側邊攔" })

keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "取消搜尋高亮" })

-- 跳轉到上一個/下一個錯誤（這通常會搭配 open_float 使用）
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "上一個診斷訊息" })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "下一個診斷訊息" })



-- 開啟聊天
keymap.set("n", "<leader>aa", "<cmd>GpChatToggle<CR>")

-- 對選取內容做 AI 操作（核心）
keymap.set("v", "<leader>ai", "<cmd>GpRewrite<CR>")

-- 讓 AI 幫你寫 code
keymap.set("n", "<leader>ac", "<cmd>GpChatNew<CR>")
