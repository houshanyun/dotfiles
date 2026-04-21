require("core.options")
require("core.autocmd")
require("core.keymaps")
require("core.lazy")

vim.cmd [[ colorscheme solarized-osaka ]]
-- 在你的 init.lua 中加入此自動命令
-- vim.api.nvim_create_autocmd('FileType', {
--   -- 列出你想要開啟高亮的語言
--   pattern = { 'typescript', 'tsx', 'javascript', 'lua', 'html', 'css' },
--   callback = function()
--     vim.treesitter.start()
--   end,
-- })

-- 建議放在 FileType 的 autocmd 裡，或全域設定

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'typescript', 'tsx', 'javascript', 'lua', 'html', 'css' },
--   callback = function()
--     vim.wo.foldmethod = 'expr'
--     vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--   end,
-- })

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'typescript', 'tsx', 'javascript', 'lua' },
--   callback = function()
--     -- 注意這裡的引號用法是官方要求的
--     vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--   end,
-- })

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }

require("notify").setup({
  background_colour = "#000000"
})

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

--vim.diagnostic.config({
--virtual_text = true,      -- 開啟行末文字
--signs = true,             -- 在左側邊欄顯示圖示 (Error, Warn 等)
--underline = true,         -- 錯誤代碼下方加底線
--update_in_insert = false, -- 打字時不要一直跳錯誤訊息（避免干擾）
--severity_sort = true,
--})
