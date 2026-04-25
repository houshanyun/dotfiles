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
