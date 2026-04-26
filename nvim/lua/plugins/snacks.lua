-- lua/plugins/snacks.lua
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- 替代 Telescope 的 UI 與 Picker 功能
    picker = { enabled = true },
    -- 替代 mini.indentscope
    indent = {
      enabled = true,
      char = "│",
      animate = { enabled = true },
    },
    -- 替代基礎的輸入/選擇介面
    input = { enabled = true },
    select = { enabled = true },
    -- 提供更美觀的通知系統 (可配合 Noice)
    notifier = { enabled = true, timeout = 3000 },
    -- 提供類似 Gitsigns 的邊欄資訊與導覽
    git = { enabled = true },
    -- 替代跳轉 (如替代傳統的快捷鍵)
    words = { enabled = true },
    -- 提供一個漂亮的大廳介面
    dashboard = { enabled = true },
    -- 提供滾動優化
    scroll = { enabled = true },
    -- 快速在浮動視窗中開啟 Terminal
    terminal = { enabled = true },
    -- =========================
    -- ✨ 新增功能模組
    -- =========================
    -- 1. Status Column: 點擊行號摺疊、美化邊欄
    statuscolumn = { enabled = true },
    -- 2. Win: 浮動視窗管理器
    win = { enabled = true },
    -- 3. Scroll: 讓捲動更平滑
  },
  keys = {
    -- =========================
    -- 🔍 Picker (替代原 Telescope 快捷鍵)
    -- =========================
    { "<leader>ff", function() Snacks.picker.files() end,                 desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end,                  desc = "Grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end,               desc = "Buffers" },
    { "<leader>fr", function() Snacks.picker.recent() end,                desc = "Recent" },
    { "<leader>e",  function() Snacks.picker.explorer() end,              desc = "File Explorer" }, -- 替代 Telescope file_browser

    -- 🧠 LSP + Picker 整合
    { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
    { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                        desc = "References" },
    { "gi",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
    { "gt",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
    { "<leader>ds", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
    { "<leader>ws", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    -- Diagnostics
    { "<leader>dd", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },

    -- =========================
    -- 🎸 Git 功能 (整合 Snacks)
    -- =========================
    { "<leader>gb", function() Snacks.git.blame_line() end,               desc = "Git Blame Line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end,             desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end,                      desc = "Lazygit" },
    { "<leader>gL", function() Snacks.picker.git_log() end,               desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end,            desc = "Git Status" },

    -- =========================
    -- 🚀 Git Hunk (gh) 相關
    -- =========================
    -- 使用 Snacks 內建的 git 工具來跳轉與預覽 Hunk
    --{ "gh",         function() Snacks.git.blame_line() end,               desc = "Git Blame Line" },
    { "]h",         function() Snacks.git.next_hunk() end,                desc = "Next Hunk" },
    { "[h",         function() Snacks.git.prev_hunk() end,                desc = "Prev Hunk" },
    { "<leader>gd", function() Snacks.picker.git_diff() end,              desc = "Git Diff (Picker)" },
    --{ "<leader>gf", function() Snacks.picker.git_log_file() end,          desc = "Git Log File" },

    -- =========================
    -- 🛠️ 工具與系統
    -- =========================
    { "<leader>un", function() Snacks.notifier.hide() end,                desc = "Dismiss All Notifications" },
    { "<C-/>",      function() Snacks.terminal() end,                     desc = "Terminal" },
    { "<leader>tt", function() Snacks.terminal() end,                     desc = "Terminal" },
    { "]]",         function() Snacks.words.jump(1) end,                  desc = "Next Reference" },
    { "[[",         function() Snacks.words.jump(-1) end,                 desc = "Prev Reference" },
    -- 使用 Snacks.win 展示一個浮動的 Scratch Buffer (筆記本)
    { "<leader>.",  function() Snacks.scratch() end,                      desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end,               desc = "Select Scratch Buffer" },
    -- =========================
    -- 💡 LSP Hover 增強
    -- =========================
    -- 如果你想用 Snacks 處理 LSP Hover (替代 K)
    {
      "K",
      function()
        Snacks.words.jump(0); vim.lsp.buf.hover()
      end,
      desc = "Hover"
    },
    {
      "<leader>N",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
      desc = "Neovim News",
    }
  },
  init = function()
    -- 設定全域變數讓其他外掛識別
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Debugger 輔助
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- 取代預設 print 用於更好的視覺化除錯

        -- 建立一些 Toggle 切換快捷鍵 (Snacks 特色功能)
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>ur")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
