-- ================================================================================================
-- 核心編碼設定
-- ================================================================================================
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"

-- ================================================================================================
-- 1. 介面與外觀設定
-- ================================================================================================
vim.opt.laststatus = 3        -- 全局狀態欄：所有分割視窗共用同一個狀態欄 (適合 lualine)
vim.opt.number = true         -- 顯示行號
vim.opt.relativenumber = true -- 顯示相對行號 (便於快速跳轉)
vim.opt.cursorline = true     -- 高亮游標所在行
vim.opt.signcolumn = "yes"    -- 始終顯示符號欄 (防止 LSP 提示圖示出現時畫面跳動)
vim.opt.scrolloff = 8         -- 垂直捲動時游標上下保留 8 行空間
vim.opt.sidescrolloff = 8     -- 水平捲動時游標左右保留 8 字元空間
vim.opt.wrap = false          -- 關閉自動換行
vim.opt.termguicolors = true  -- 開啟 24 位元真彩色支持
vim.opt.showmatch = true      -- 輸入括號時，游標會短暫跳到對應的括號上
vim.opt.matchtime = 2         -- 括號匹配跳轉顯示的時間 (單位: 0.1秒)
--vim.opt.colorcolumn = "100"   -- 在第 100 字元處顯示垂直線 (提醒程式碼長度)

-- ================================================================================================
-- 2. 操作行為與剪貼簿
-- ================================================================================================
vim.opt.clipboard = "unnamedplus" -- 與系統剪貼簿連動
vim.opt.mouse = "a"               -- 啟用滑鼠支援 (捲動、調整視窗)
vim.opt.iskeyword:append("-")     -- 將 '-' 視為單字的一部分 (對開發 Tailwind/CSS 極其有用)
vim.opt.selection = "inclusive"   -- 選取範圍包含最後一個字元

-- ================================================================================================
-- 3. 現代 UI 延伸設定 (針對 noice/lualine 與 0.12 版本)
-- ================================================================================================
vim.opt.cmdheight = 0    -- 隱藏命令列：只有在輸入時才顯示 (建議搭配 noice.nvim)
vim.opt.showmode = false -- 不顯示 --INSERT-- 等模式文字 (狀態欄已提供)
vim.opt.pumheight = 10   -- 補全選單最大高度
vim.opt.pumblend = 10    -- 補全選單透明度

-- 0.12 實驗性功能：啟用新的 UI2 渲染引擎
if vim.fn.has('nvim-0.12') == 1 then
  require('vim._core.ui2').enable()
end

-- ================================================================================================
-- 4. 縮排與搜尋設定
-- ================================================================================================
vim.opt.tabstop = 2        -- Tab 寬度
vim.opt.shiftwidth = 2     -- 自動縮排寬度
vim.opt.expandtab = true   -- 將 Tab 轉換為空白
vim.opt.smartindent = true -- 智慧縮排

vim.opt.ignorecase = true  -- 搜尋時忽略大小寫
vim.opt.smartcase = true   -- 若搜尋詞含大寫，則自動切換為精確匹配
vim.opt.incsearch = true   -- 邊輸入邊即時跳轉到搜尋結果
vim.opt.hlsearch = false   -- 搜尋完畢後不持續高亮 (可依個人喜好開啟)

vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

-- ================================================================================================
-- 5. 檔案處理與備份 (安全與效能)
-- ================================================================================================
vim.opt.swapfile = false    -- 不產生 .swp 交換檔
vim.opt.backup = false      -- 不建立備份檔
vim.opt.writebackup = false -- 寫入檔案前不進行備份
vim.opt.updatetime = 250    -- 回應時間設定 (影響 LSP 提示與 Swap 寫入速度)
vim.opt.timeoutlen = 500    -- 等待快捷鍵序列輸入的時間

-- 持久化撤銷 (Persistent Undo)：關閉檔案後再開啟仍可撤銷
vim.opt.undofile = true
local undodir = vim.fn.expand("~/.local/share/nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir

-- ================================================================================================
-- 6. 視窗分割與摺疊
-- ================================================================================================
vim.opt.splitbelow = true                            -- 水平分割在下方
vim.opt.splitright = true                            -- 垂直分割在右方

vim.opt.foldenable = false                           -- 預設不自動摺疊程式碼
vim.opt.foldmethod = 'expr'                          -- 使用表達式摺疊
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- 配合 Treesitter 進行摺疊

-- ================================================================================================
-- 7. 其他外掛相關
-- ================================================================================================
vim.g.loaded_netrw = 1 -- 禁用內建的 netrw (在使用 nvim-tree 時建議開啟)
vim.g.loaded_netrwPlugin = 1
