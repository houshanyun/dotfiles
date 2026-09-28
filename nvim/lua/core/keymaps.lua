vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "K", vim.lsp.buf.hover)
keymap("n", "<leader>rn", vim.lsp.buf.rename)
keymap("n", "<leader>ca", vim.lsp.buf.code_action)

-- signature（fallback）
keymap("i", "<C-k>", vim.lsp.buf.signature_help)

-- =========================
-- 🐞 diagnostics（快速跳）
-- =========================

-- keymap("n", "[d", vim.diagnostic.goto_prev)
-- keymap("n", "]d", vim.diagnostic.goto_next)
-- keymap("n", "<leader>de", vim.diagnostic.open_float)

-- =========================
-- 🧹 其他
-- =========================

keymap("n", "<leader>nh", "<cmd>nohlsearch<cr>")
