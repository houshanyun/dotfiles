-- 基礎編碼設定
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8,ucs-bom,gb18030,gbk,big5,latin1"

-- 1. 介面基礎外觀設定
vim.opt.laststatus = 3            -- 全域狀態列（Global Statusline），所有視窗共用一個狀態列 (配合 lualine)
vim.opt.number = true             -- 顯示行號
vim.opt.relativenumber = true     -- 顯示相對行號（方便跳轉）
vim.opt.cursorline = true         -- 高亮當前行
vim.opt.signcolumn = "yes"        -- 總是顯示標記欄（避免 LSP 符號出現時畫面抖動）
vim.opt.scrolloff = 8             -- 游標距離頂部或底部 8 行時開始滾動
vim.opt.sidescrolloff = 8         -- 游標距離左右邊緣 8 個字元時開始滾動
vim.opt.wrap = false              -- 不自動換行
vim.opt.clipboard = "unnamedplus" -- 使用系統剪貼簿

-- 2. 進階 UI 與 外掛優化設定 (針對 noice/lualine 等)
vim.opt.cmdheight = 0    -- 隱藏命令列（當沒有輸入時不佔空間，建議配合 noice 外掛）
vim.opt.showmode = false -- 不顯示 --INSERT-- 等模式文字（因為狀態列外掛如 lualine 已提供）

-- 3. 縮排與空格設定 (開發慣例設定)
vim.opt.tabstop = 2        -- Tab 佔用的空格數
vim.opt.shiftwidth = 2     -- 自動縮排時的空格數
vim.opt.expandtab = true   -- 將 Tab 自動轉換為空格
vim.opt.smartindent = true -- 啟動智慧縮排

-- 4. 搜尋與系統反應優化
vim.opt.ignorecase = true -- 搜尋時忽略大小寫
vim.opt.smartcase = true  -- 搜尋時若包含大寫字母，則不忽略大小寫
vim.opt.hlsearch = false  -- 搜尋完成後取消高亮標記（視個人習慣，或可用 :noh 手動取消）
vim.opt.updatetime = 250  -- 系統反應時間（影響 Swap 寫入及 LSP 懸浮視窗觸發速度）
vim.opt.timeoutlen = 500  -- 按鍵組合序列的等待時間（例如 leader key）
vim.opt.splitbelow = true -- 水平分割視窗在下方開啟
vim.opt.splitright = true -- 垂直分割視窗在右方開啟

-- 5. 檔案系統與快取設定
vim.opt.swapfile = false    -- 不產生 .swp 交換檔案
vim.opt.backup = false      -- 不產生備份檔
vim.opt.writebackup = false -- 寫入檔案時不產生暫時備份
--vim.lsp.inlay_hint.enable(true) -- LSP 內聯提示（視需求開啟）

-- 0.12 版本預覽功能：自動補全與 UI 優化 (測試功能)
--vim.opt.completeopt = "menu,menuone,noselect,nearest"
--vim.opt.autocomplete = true
--vim.opt.pumborder = "rounded"
--vim.opt.pummaxwidth = 40

-- 0.12 新功能：啟用內置的 UI2 框架（優化繪製效能）
if vim.fn.has('nvim-0.12') == 1 then
  require('vim._core.ui2').enable()
end

-- 程式碼摺疊設定 (使用 Treesitter 提供的高效摺疊)
vim.opt.foldenable = false -- 預設開啟檔案時不自動摺疊
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- nvim-tree.lua 外掛相容性設定
vim.opt.termguicolors = true -- 開啟真彩色支持
vim.g.loaded_netrw = 1       -- 停用內建的 netrw 檔案瀏覽器
vim.g.loaded_netrwPlugin = 2 -- 徹底停用 netrw 相關功能
