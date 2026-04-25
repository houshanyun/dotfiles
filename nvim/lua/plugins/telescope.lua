return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' },
    { 'nvim-telescope/telescope-ui-select.nvim' }, -- 讓代碼重構選單也變漂亮
    { "nvim-telescope/telescope-file-browser.nvim" },
  },
  -- 快捷鍵設置
  keys = {
    --   { '<leader>ff', '<cmd>Telescope find_files<cr>',                                 desc = 'Find Files' },
    --   { '<leader>fg', '<cmd>Telescope live_grep<cr>',                                  desc = 'Live Grep' },
    --   { '<leader>fr', '<cmd>Telescope oldfiles<cr>',                                   desc = 'Recent Files' },
    --   { '<leader>fb', '<cmd>Telescope buffers<cr>',                                    desc = 'Buffers' },
    --   { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    { "<leader>e", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
    --   { "<leader>E",  "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File Browser (current dir)" },
    --   { "gd",         "<cmd>Telescope lsp_definitions<cr>",                            desc = "Goto Definition" },
    --   { "gr",         "<cmd>Telescope lsp_references<cr>",                             desc = "References" },
    --   { "gi",         "<cmd>Telescope lsp_implementations<cr>",                        desc = "Implementations" },
    --   { "gt",         "<cmd>Telescope lsp_type_definitions<cr>",                       desc = "Type Definitions" },
    --
    --   { "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>",                       desc = "Document Symbols" },
    --   { "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",              desc = "Workspace Symbols" },
    --   { "<leader>dd", "<cmd>Telescope diagnostics<cr>" }
  },
  -- 插件參數配置
  -- opts = function()
  --   local actions = require("telescope.actions")
  --   return {
  --     defaults = {
  --       -- 忽略不必要的檔案，讓搜尋更精準且不卡頓
  --       file_ignore_patterns = {
  --         "node_modules", "android/", "ios/", "%.app/", "%.ipa/", "build/", ".git/"
  --       },
  --       path_display = { "smart" },
  --       mappings = {
  --         i = {
  --           ["<C-j>"] = actions.move_selection_next,                  -- 用 Ctrl-j 下移
  --           ["<C-k>"] = actions.move_selection_previous,              -- 用 Ctrl-k 上移
  --           ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- 批次處理
  --         },
  --       },
  --     },
  --     extensions = {
  --       ["ui-select"] = {
  --         require("telescope.themes").get_dropdown(),
  --       },
  --     },
  --   }
  -- end,
  opts = function()
    local actions = require("telescope.actions")
    local themes = require("telescope.themes")

    return {
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        path_display = { "smart" },

        -- ⭐ UI核心
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.9,
          height = 0.85,
          preview_cutoff = 120,
        },

        sorting_strategy = "ascending",

        winblend = 10,

        border = true,

        file_ignore_patterns = {
          "node_modules", "android/", "ios/", "%.app/", "%.ipa/", "build/", ".git/"
        },

        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      },

      -- ⭐ 不同 picker 用不同 UI（重點）
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },

        buffers = {
          theme = "ivy",
          sort_lastused = true,
        },

        oldfiles = {
          theme = "dropdown",
        },

        live_grep = {
          layout_strategy = "horizontal",
        },
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true, -- ⭐ 直接取代 netrw
        },
        lsp_definitions = {
          theme = "dropdown",
          previewer = false,
        },

        lsp_references = {
          theme = "ivy",
        },

        lsp_implementations = {
          theme = "dropdown",
        },

        lsp_type_definitions = {
          theme = "dropdown",
        },
      },

      extensions = {
        ["ui-select"] = themes.get_dropdown({
          winblend = 10,
          previewer = false,
        }),
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    -- 加載擴展
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
    -- vim.ui.select = require("telescope.themes").get_dropdown({})
    vim.ui.select = telescope.extensions["ui-select"].select
    -- Solarized Osaka 配色
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1a1a2e" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#268bd2", bg = "#1a1a2e" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#1f2335" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#2aa198", bg = "#1f2335" })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#1a1a2e", bg = "#2aa198", bold = true })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#268bd2", bg = "#1a1a2e" })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#268bd2", bold = true })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#6c71c4", bg = "#1a1a2e" })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#1a1a2e", bg = "#6c71c4", bold = true })
    vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#2d3f76", bold = true })
    vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#e5c07b", bold = true })
  end,
}
