return {
  "saghen/blink.cmp",
  version = "1.*",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
  },
  opts = {
    -- 1. 鍵位設定
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

    -- 2. 片段設定
    snippets = { preset = 'luasnip' },

    -- 3. 補全來源設定 (這裡最常出錯)
    sources = {
      default = { "snippets", "lsp", "path", "buffer" },
      providers = {
        snippets = {
          name = "Snippets",
        },
        path = {
          opts = { trailing_slash = true },
        },
      }, -- 這裡對應 providers 的結束
    },   -- 這裡對應 sources 的結束

    -- 4. 命令列設定
    cmdline = {
      completion = { menu = { auto_show = true } },
    },

    -- 5. 補全外觀與行為
    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false
        }
      },
      menu = {
        border = "rounded",
        draw = {
          columns = {
            { "label",      "label_description", gap = 1 },
            { "kind_icon",  "kind" },
            { "source_name" },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 400,
        window = { border = "rounded" },
      },
      ghost_text = {
        enabled = true,
      },
    },
  }, -- 這裡對應 opts 的結束
}    -- 這裡對應 return 的結束
