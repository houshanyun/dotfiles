return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    notify = {
      enabled = true, -- 🔥 只用 Noice notification
    },

    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },

    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },

    cmdline = {
      format = {
        cmdline     = { icon = "󰘵 " },
        search_down = { icon = "󰍉 " },
        search_up   = { icon = "󰍉 " },
        filter      = { icon = " " },
        lua         = { icon = "󰢱 " },
        help        = { icon = "󰋖 " },
      },
    },

    routes = {
      {
        filter = { event = "msg_show", kind = "", find = "written" },
        opts = { skip = true },
      },
    },
  },

  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
