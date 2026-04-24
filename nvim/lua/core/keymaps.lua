-- vim.g.mapleader = " " -- 設置空格鍵為 Leader Key
--
-- local keymap = vim.keymap
-- -- keymap.set("n", "<leader>e", ":Ex <CR>")         -- 打開內置文件瀏覽器
-- --
-- -- keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "跳轉到導航定義" })
-- -- keymap.set("n", "gr", vim.lsp.buf.references)
-- -- keymap.set("n", "gi", vim.lsp.buf.implementation)
-- -- keymap.set("n", "gy", vim.lsp.buf.type_definition)
-- keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "顯示導航參數類型" })
-- keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)
-- keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
-- keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
-- -- keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "顯示浮動診斷訊息" })
-- -- keymap.set('n', "<C-o>", "<cmd>NvimTreeToggle<CR>", { desc = "打開側邊攔" })
--
-- keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "取消搜尋高亮" })
--
-- -- 跳轉到上一個/下一個錯誤（這通常會搭配 open_float 使用）
-- keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "上一個診斷訊息" })
-- keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "下一個診斷訊息" })

vim.g.mapleader = " "

local keymap = vim.keymap.set

-- =========================
-- 🔍 Telescope（核心操作）
-- =========================

-- files / search
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")

-- file browser（取代 netrw / nvim-tree）
keymap("n", "<leader>e", "<cmd>Telescope file_browser<cr>")

-- =========================
-- 🧠 LSP + Telescope（核心）
-- =========================

keymap("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>")
keymap("n", "gi", "<cmd>Telescope lsp_implementations<cr>")
keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>")

keymap("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>")
keymap("n", "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")

-- diagnostics（錯誤列表）
keymap("n", "<leader>dd", "<cmd>Telescope diagnostics<cr>")

-- =========================
-- ⚙️ LSP（保留原生）
-- =========================

keymap("n", "K", vim.lsp.buf.hover)
keymap("n", "<leader>rn", vim.lsp.buf.rename)
keymap("n", "<leader>ca", vim.lsp.buf.code_action)

-- signature（fallback）
keymap("i", "<C-k>", vim.lsp.buf.signature_help)

-- =========================
-- 🐞 diagnostics（快速跳）
-- =========================

keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "<leader>de", vim.diagnostic.open_float)

-- =========================
-- 🧹 其他
-- =========================

keymap("n", "<leader>nh", "<cmd>nohlsearch<cr>")
