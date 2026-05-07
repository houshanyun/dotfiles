-- -- lua/plugins/snacks.lua
-- return {
--   "folke/snacks.nvim",
--   priority = 1000,
--   lazy = false,
--   ---@type snacks.Config
--   opts = {
--     -- 替代 Telescope 的 UI 與 Picker 功能
--     picker = { enabled = true },
--     -- 替代 mini.indentscope
--     indent = {
--       enabled = true,
--       char = "│",
--       animate = { enabled = true },
--     },
--     -- 替代基礎的輸入/選擇介面
--     input = { enabled = true },
--     select = { enabled = true },
--     -- 提供更美觀的通知系統 (可配合 Noice)
--     notifier = { enabled = true, timeout = 3000 },
--     -- 提供類似 Gitsigns 的邊欄資訊與導覽
--     git = { enabled = true },
--     -- 替代跳轉 (如替代傳統的快捷鍵)
--     words = { enabled = true },
--     -- 提供一個漂亮的大廳介面
--     dashboard = { enabled = true },
--     -- 提供滾動優化
--     scroll = { enabled = true },
--     -- 快速在浮動視窗中開啟 Terminal
--     terminal = { enabled = true },
--     -- =========================
--     -- ✨ 新增功能模組
--     -- =========================
--     -- 1. Status Column: 點擊行號摺疊、美化邊欄
--     statuscolumn = { enabled = true },
--     -- 2. Win: 浮動視窗管理器
--     win = { enabled = true },
--     -- 3. Scroll: 讓捲動更平滑
--   },
--   keys = {
--     -- =========================
--     -- 🔍 Picker (替代原 Telescope 快捷鍵)
--     -- =========================
--     { "<leader>ff", function() Snacks.picker.files() end,                 desc = "Find Files" },
--     { "<leader>fg", function() Snacks.picker.grep() end,                  desc = "Grep" },
--     { "<leader>fb", function() Snacks.picker.buffers() end,               desc = "Buffers" },
--     { "<leader>fr", function() Snacks.picker.recent() end,                desc = "Recent" },
--     { "<leader>e",  function() Snacks.picker.explorer() end,              desc = "File Explorer" }, -- 替代 Telescope file_browser
--
--     -- 🧠 LSP + Picker 整合
--     { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
--     { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                        desc = "References" },
--     { "gi",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
--     { "gt",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
--     { "<leader>ds", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
--     { "<leader>ws", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
--
--     -- Diagnostics
--     { "<leader>dd", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
--
--     -- =========================
--     -- 🎸 Git 功能 (整合 Snacks)
--     -- =========================
--     { "<leader>gb", function() Snacks.git.blame_line() end,               desc = "Git Blame Line" },
--     { "<leader>gf", function() Snacks.lazygit.log_file() end,             desc = "Lazygit Current File History" },
--     { "<leader>gg", function() Snacks.lazygit() end,                      desc = "Lazygit" },
--     { "<leader>gL", function() Snacks.picker.git_log() end,               desc = "Git Log" },
--     { "<leader>gs", function() Snacks.picker.git_status() end,            desc = "Git Status" },
--
--     -- =========================
--     -- 🚀 Git Hunk (gh) 相關
--     -- =========================
--     -- 使用 Snacks 內建的 git 工具來跳轉與預覽 Hunk
--     --{ "gh",         function() Snacks.git.blame_line() end,               desc = "Git Blame Line" },
--     { "]h",         function() Snacks.git.next_hunk() end,                desc = "Next Hunk" },
--     { "[h",         function() Snacks.git.prev_hunk() end,                desc = "Prev Hunk" },
--     { "<leader>gd", function() Snacks.picker.git_diff() end,              desc = "Git Diff (Picker)" },
--     --{ "<leader>gf", function() Snacks.picker.git_log_file() end,          desc = "Git Log File" },
--
--     -- =========================
--     -- 🛠️ 工具與系統
--     -- =========================
--     { "<leader>un", function() Snacks.notifier.hide() end,                desc = "Dismiss All Notifications" },
--     { "<C-/>",      function() Snacks.terminal() end,                     desc = "Terminal" },
--     { "<leader>tt", function() Snacks.terminal() end,                     desc = "Terminal" },
--     { "]]",         function() Snacks.words.jump(1) end,                  desc = "Next Reference" },
--     { "[[",         function() Snacks.words.jump(-1) end,                 desc = "Prev Reference" },
--     -- 使用 Snacks.win 展示一個浮動的 Scratch Buffer (筆記本)
--     { "<leader>.",  function() Snacks.scratch() end,                      desc = "Toggle Scratch Buffer" },
--     { "<leader>S",  function() Snacks.scratch.select() end,               desc = "Select Scratch Buffer" },
--     -- =========================
--     -- 💡 LSP Hover 增強
--     -- =========================
--     -- 如果你想用 Snacks 處理 LSP Hover (替代 K)
--     {
--       "K",
--       function()
--         Snacks.words.jump(0); vim.lsp.buf.hover()
--       end,
--       desc = "Hover"
--     },
--     {
--       "<leader>N",
--       function()
--         Snacks.win({
--           file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
--           width = 0.6,
--           height = 0.6,
--           wo = {
--             spell = false,
--             wrap = false,
--             signcolumn = "yes",
--             statuscolumn = " ",
--             conceallevel = 3,
--           },
--         })
--       end,
--       desc = "Neovim News",
--     }
--   },
--   init = function()
--     -- 設定全域變數讓其他外掛識別
--     vim.api.nvim_create_autocmd("User", {
--       pattern = "VeryLazy",
--       callback = function()
--         -- Debugger 輔助
--         _G.dd = function(...)
--           Snacks.debug.inspect(...)
--         end
--         _G.bt = function()
--           Snacks.debug.backtrace()
--         end
--         vim.print = _G.dd -- 取代預設 print 用於更好的視覺化除錯
--
--         -- 建立一些 Toggle 切換快捷鍵 (Snacks 特色功能)
--         Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
--         Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
--         Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>ur")
--         Snacks.toggle.diagnostics():map("<leader>ud")
--         Snacks.toggle.line_number():map("<leader>ul")
--         Snacks.toggle.inlay_hints():map("<leader>uh")
--         Snacks.toggle.indent():map("<leader>ug")
--         Snacks.toggle.dim():map("<leader>uD")
--       end,
--     })
--   end,
-- }



-- =============================================================================
-- lua/plugins/snacks.lua
-- snacks.nvim 完整設定
-- 配色：solarized-osaka.nvim
-- =============================================================================

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {

    -- =========================================================================
    -- ✅ / ❌ 模組開關
    -- =========================================================================
    bigfile   = { enabled = true },
    -- explorer  = { enabled = true },
    -- picker    = { enabled = true },
    quickfile = { enabled = true },
    -- words     = { enabled = true },
    bufdelete = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit   = { enabled = true },
    scratch   = { enabled = true },
    -- terminal  = { enabled = true },
    -- dim       = { enabled = true },
    -- zen       = { enabled = true },
    -- scroll    = { enabled = true },

    -- ❌ 停用（已有其他插件處理）
    indent    = { enabled = false }, -- 已有 mini.indentscope
    notifier  = { enabled = false }, -- 已有 noice + nvim-notify
    input     = { enabled = false }, -- 已有 noice

    -- =========================================================================
    -- 🎨 全域視窗樣式（solarized-osaka 配色）
    -- =========================================================================
    styles    = {
      -- 所有浮動視窗的預設樣式
      float = {
        border   = "rounded",
        backdrop = { transparent = true, blend = 30 },
      },
      -- 終端機視窗
      terminal = {
        border = "rounded",
        wo     = { winhighlight = "Normal:SnacksTerminal,FloatBorder:SnacksTerminalBorder" },
      },
      -- Zen 模式主視窗
      zen = {
        border = "none",
        wo     = { winhighlight = "Normal:SnacksZen" },
      },
      -- Picker（搜尋視窗）
      picker_input = {
        border = "rounded",
      },
      picker_list = {
        border = "rounded",
      },
      picker_preview = {
        border = "rounded",
      },
    },

    -- =========================================================================
    -- 🖥️  終端機（底部分割）
    -- =========================================================================
    terminal  = {
      enabled = true,
      win = {
        position = "float",
        width    = 0.9,
        height   = 0.9,
        border   = "rounded",
        -- solarized-osaka: 深藍底色 + 亮邊框
        wo       = {
          winhighlight = "Normal:SnacksTerminal,FloatBorder:SnacksTerminalBorder",
        },
      },
    },

    -- =========================================================================
    -- 🌊 平滑滾動
    -- =========================================================================
    scroll    = {
      enabled = true,
      -- animate 使用 snacks 內建預設，easing 欄位需傳入函數而非字串
      -- 不自訂以避免錯誤
    },

    -- =========================================================================
    -- 📂 Explorer 側邊欄
    -- =========================================================================
    explorer  = {
      enabled       = true,
      replace_netrw = true,
    },

    -- =========================================================================
    -- 🌒 Dim（非作用域調暗）
    -- =========================================================================
    dim       = {
      enabled = true,
      scope   = {
        min_size = 5,
        max_size = 20,
        siblings = true,
      },
      -- animate 使用 snacks 內建預設，避免 easing 字串錯誤
    },

    -- =========================================================================
    -- 🧘 Zen 專注模式
    -- =========================================================================
    zen       = {
      enabled = true,
      toggles = {
        dim         = true,
        git_signs   = false,
        diagnostics = false,
        inlay_hints = false,
      },
      win = {
        width    = 0.7,
        backdrop = {
          transparent = true,
          blend       = 40,
        },
      },
    },

    -- =========================================================================
    -- 📖 Words（LSP 參考高亮）
    -- =========================================================================
    words     = {
      enabled     = true,
      debounce    = 200,
      -- 使用 solarized-osaka 的底線高亮色
      notify_jump = false,
    },

    -- =========================================================================
    -- 🏠 Dashboard（ASCII Logo + 快捷鍵 + 最近檔案）
    -- =========================================================================
    dashboard = {
      enabled  = true,
      preset   = {
        -- solarized-osaka 主題的 Neovim ASCII Logo
        header = [[

      ████ ██████           █████      ██
     ███████████             █████
     █████████ ███████████████████ ███   ███████████
    █████████  ███    █████████████ █████ ██████████████
   █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
          { icon = " ", key = "g", desc = "Live Grep", action = ":lua Snacks.picker.grep()" },
          { icon = " ", key = "e", desc = "Explorer", action = ":lua Snacks.explorer()" },
          { icon = " ", key = "l", desc = "LazyGit", action = ":lua Snacks.lazygit()" },
          { icon = "󰒲 ", key = "L", desc = "Lazy Plugins", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        {
          section = "keys",
          gap     = 1,
          padding = 1,
        },
        {
          section = "recent_files",
          limit   = 8,
          padding = 1,
        },
        { section = "startup" },
      },
    },

    -- =========================================================================
    -- 🔍 Picker 外觀
    -- =========================================================================
    picker    = {
      enabled = true,
      layout  = {
        preset = "default",
        cycle  = true,
      },
      -- Esc 關閉 picker（insert 和 normal 模式皆可）
      actions = {},
      win     = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
      icons   = {
        files = {
          enabled = true,
        },
      },
    },
  },

  -- =========================================================================
  -- ⌨️  快捷鍵
  -- =========================================================================
  keys = {
    -- 📁 檔案搜尋（取代 telescope）
    { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end,                                    desc = "Live Grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent Files" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },

    -- 📂 側邊欄 Explorer（toggle）
    { "<leader>e",  function() Snacks.explorer() end,                                       desc = "Toggle Explorer" },

    -- 🧠 LSP（取代 telescope lsp_*）
    { "gd",         function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gr",         function() Snacks.picker.lsp_references() end,                          desc = "References",           nowait = true },
    { "gi",         function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gt",         function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto Type Definition" },
    { "<leader>ds", function() Snacks.picker.lsp_symbols() end,                             desc = "Document Symbols" },
    { "<leader>ws", function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "Workspace Symbols" },

    -- 🐞 Diagnostics
    { "<leader>dd", function() Snacks.picker.diagnostics() end,                             desc = "Workspace Diagnostics" },
    { "<leader>dD", function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },

    -- 🔍 其他搜尋
    { "<leader>sh", function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>sc", function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>sr", function() Snacks.picker.resume() end,                                  desc = "Resume Picker" },
    { "<leader>su", function() Snacks.picker.undo() end,                                    desc = "Undo History" },
    { "<leader>sm", function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sj", function() Snacks.picker.jumps() end,                                   desc = "Jumps" },

    -- 🔀 Git
    { "<leader>gg", function() Snacks.lazygit() end,                                        desc = "LazyGit" },
    { "<leader>gB", function() Snacks.gitbrowse() end,                                      desc = "Git Browse",           mode = { "n", "v" } },
    { "<leader>gl", function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gb", function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>gd", function() Snacks.picker.git_diff() end,                                desc = "Git Diff Hunks" },

    -- 🖥️  終端機（底部分割）WSL 用 <C-_> 代替 <C-/>
    { "<C-t>",      function() Snacks.terminal() end,                                       desc = "Toggle Terminal",      mode = { "n", "t" } },
    { "<Esc>",      "<C-\\><C-n>",                                                          desc = "Exit Terminal Mode",   mode = "t" },

    -- 🧘 Zen / Dim
    { "<leader>z",  function() Snacks.zen() end,                                            desc = "Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end,                                       desc = "Zoom" },
    { "<leader>uD", function() Snacks.dim() end,                                            desc = "Toggle Dim" },

    -- 📝 Scratch
    { "<leader>.",  function() Snacks.scratch() end,                                        desc = "Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },

    -- 🗑️  Buffer 安全刪除
    { "<leader>bd", function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },

    -- 📖 LSP Words 跳轉（在同名變數間跳轉）
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",       mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",       mode = { "n", "t" } },
  },

  -- =========================================================================
  -- 🎨 配色整合（solarized-osaka）
  -- =========================================================================
  init = function()
    -- solarized-osaka 色盤
    local c = {
      base03  = "#002b36", -- 最深背景
      base02  = "#073642", -- 深背景
      base01  = "#586e75", -- 註解 / 次要內容
      base0   = "#839496", -- 主要文字
      base1   = "#93a1a1", -- 較亮文字
      base3   = "#fdf6e3", -- 最亮（light theme 背景）
      yellow  = "#b58900",
      orange  = "#cb4b16",
      red     = "#dc322f",
      magenta = "#d33682",
      violet  = "#6c71c4",
      blue    = "#268bd2",
      cyan    = "#2aa198",
      green   = "#859900",
    }

    -- 設定 snacks 各元件的 highlight groups
    local function set_hl()
      -- 終端機
      vim.api.nvim_set_hl(0, "SnacksTerminal", { bg = c.base03 })
      vim.api.nvim_set_hl(0, "SnacksTerminalBorder", { fg = c.blue, bg = c.base03 })

      -- Zen 模式背景
      vim.api.nvim_set_hl(0, "SnacksZen", { bg = c.base03 })
      vim.api.nvim_set_hl(0, "SnacksZenBorder", { fg = c.base01, bg = c.base03 })

      -- Dashboard header（使用 cyan 色）
      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = c.cyan, bold = true })
      vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = c.base01, italic = true })
      vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = c.base0 })
      vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = c.blue, bold = true })
      vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = c.cyan })
      vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = c.violet })

      -- Picker
      vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = c.blue, bg = c.base03 })
      vim.api.nvim_set_hl(0, "SnacksPickerMatch", { fg = c.cyan, bold = true })
      vim.api.nvim_set_hl(0, "SnacksPickerSelected", { fg = c.yellow, bold = true })
      vim.api.nvim_set_hl(0, "SnacksPickerSearch", { fg = c.green })

      -- Words（LSP 參考高亮）
      vim.api.nvim_set_hl(0, "SnacksWordsRead", { underline = true, sp = c.cyan })
      vim.api.nvim_set_hl(0, "SnacksWordsWrite", { underline = true, sp = c.orange })

      -- Notifier（雖停用，保留備用）
      vim.api.nvim_set_hl(0, "SnacksNotifierBorderInfo", { fg = c.cyan })
      vim.api.nvim_set_hl(0, "SnacksNotifierBorderWarn", { fg = c.yellow })
      vim.api.nvim_set_hl(0, "SnacksNotifierBorderError", { fg = c.red })
      vim.api.nvim_set_hl(0, "SnacksNotifierBorderDebug", { fg = c.base01 })
    end

    -- 初始化 + colorscheme 切換後重新套用
    set_hl()
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern  = "*",
      callback = set_hl,
    })

    -- VeryLazy：註冊 toggle
    vim.api.nvim_create_autocmd("User", {
      pattern  = "VeryLazy",
      callback = function()
        -- Git blame toggle（整合 gitsigns）
        Snacks.toggle({
          name = "Git Blame",
          get  = function() return require("gitsigns.config").config.current_line_blame end,
          set  = function() require("gitsigns").toggle_current_line_blame() end,
        }):map("<leader>uB")

        -- Dim toggle
        Snacks.toggle({
          name = "Dim",
          get  = function() return require("snacks.dim").enabled end,
          set  = function(v)
            if v then
              require("snacks.dim").enable()
            else
              require("snacks.dim").disable()
            end
          end,
        }):map("<leader>uD")

        -- Scroll toggle
        Snacks.toggle({
          name = "Smooth Scroll",
          get  = function() return require("snacks.scroll").enabled end,
          set  = function(v)
            if v then
              require("snacks.scroll").enable()
            else
              require("snacks.scroll").disable()
            end
          end,
        }):map("<leader>uS")
      end,
    })
  end,
}
