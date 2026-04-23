return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim', -- 讓代碼重構選單也變漂亮
  },
  -- 快捷鍵設置
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>',           desc = 'Find Files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>',            desc = 'Live Grep' },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>',             desc = 'Recent Files' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>',              desc = 'Buffers' },
    { '<leader>fd', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Document Symbols' },
    { "<leader>fh", "<cmd>builtin.help_tags<cr>" }
  },
  -- 插件參數配置
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        -- 忽略不必要的檔案，讓搜尋更精準且不卡頓
        file_ignore_patterns = {
          "node_modules", "android/", "ios/", "%.app/", "%.ipa/", "build/", ".git/"
        },
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,                  -- 用 Ctrl-j 下移
            ["<C-k>"] = actions.move_selection_previous,              -- 用 Ctrl-k 上移
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- 批次處理
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    -- 加載擴展
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
