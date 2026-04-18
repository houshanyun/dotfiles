return {
  {
    "saghen/blink.cmp",
    version = "1.*", -- 使用穩定版本
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip"
    },
    opts = {
      -- 快捷鍵
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<C-d>"] = { "scroll_documentation_down" },
        ["<C-u>"] = { "scroll_documentation_up" },
      },

      -- 補全來源
      snippets = { preset = 'luasnip' },
      sources = {
        default = { "snippets", "lsp", "path", "buffer" },
        -- React Native 開發常用路徑補全
        providers = {
          snippets = {
            name = "Snippets",
            score_offset = 1000,    -- 暴力提高分值
            max_items = 8,
            min_keyword_length = 1, -- 輸入 1 個字就觸發
          },
          path = {
            opts = { trailing_slash = true },
          },
        },
      },
      cmdline = {
        --keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } },
        --ghost_text = { enabled = true },
      },

      -- 補全視窗外觀
      -- 2. 補全選單設定
      completion = {
        -- 控制選擇行為
        list = {
          selection = {
            preselect = true,
            auto_insert = false
          }
        },

        -- 補全視窗 UI
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },

        -- 文件預覽視窗
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 400,
          window = { border = "rounded" },
        },

        -- 虛擬文字 (類似 Copilot 的灰色預覽)
        ghost_text = {
          enabled = true,
        },
      },

      -- 模糊比對
      fuzzy = {
        frecency = { enabled = true },
      },

      -- LSP 能力（自動注入，不需手動設定 capabilities）
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
    },
  },
}
