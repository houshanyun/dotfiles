return {
  --{"Tsuzat/NeoSolarized.nvim",
  -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --priority = 1000, -- make sure to load this before all the other start plugins
  --opts = {},
  --},
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      styles = {
        comments  = { italic = true },
        keywords  = { italic = true },
        functions = {},
        variables = {},
      },
      on_highlights = function(hl, c)
        -- ==========================================
        -- Noice.nvim -
        -- ==========================================
        local bg                         = "#0a0e14"

        hl.NoiceCmdlinePopup             = { bg = bg, fg = "#e6f7ff" }
        hl.NoiceConfirm                  = { bg = bg }
        hl.NoiceMini                     = { bg = bg }

        hl.NormalFloat                   = { bg = bg }
        hl.FloatBorder                   = { fg = "#00ffd5", bg = bg }

        hl.NoiceCmdlinePopupBorder       = { fg = "#00ffd5", bg = "#0b0f1a" }
        hl.NoiceCmdlineIconCmdline       = { fg = "#ff4dff" }
        hl.NoiceCmdlineIconSearch        = { fg = "#ffe600" }
        hl.NoiceCmdlineIconFilter        = { fg = "#00ff85" }
        hl.NoiceCmdlineIconLua           = { fg = "#4dd2ff" }
        hl.NoiceCmdlineIconHelp          = { fg = "#ff7a18" }
        hl.NoiceCmdlinePopupBorderSearch = { fg = "#ff7a18", bg = "#0b0f1a" }
        hl.NoiceConfirmBorder            = { fg = "#b300ff" }
        hl.NoicePopupmenuBorder          = { fg = "#00ffd5" }
        hl.NoicePopupmenuMatch           = { fg = "#ff4dff", bold = true }
        hl.NoicePopupmenuSelected        = { bg = "#1a1f33", bold = true }

        -- ==========================================
        -- Treesitter - 超現實語法光譜
        -- ==========================================

        -- 關鍵字與邏輯
        hl['@keyword']                   = { fg = "#ff4dff", italic = true }
        hl['@keyword.return']            = { fg = "#ff003c", bold = true }
        hl['@keyword.function']          = { fg = "#b300ff", italic = true }
        hl['@keyword.operator']          = { fg = "#00ffd5" }
        hl['@keyword.import']            = { fg = "#ff7a18", italic = true }
        hl['@keyword.conditional']       = { fg = "#ff00aa" }
        hl['@keyword.repeat']            = { fg = "#c77dff" }

        -- 函式與方法
        hl['@function']                  = { fg = "#4dd2ff", bold = true }
        hl['@function.call']             = { fg = "#00ffd5" }
        hl['@function.method']           = { fg = "#7df9ff" }
        hl['@function.method.call']      = { fg = "#00ff85" }
        hl['@constructor']               = { fg = "#ffe600" }

        -- 變數與參數
        hl['@variable']                  = { fg = "#e6f7ff" }
        hl['@variable.builtin']          = { fg = "#ff003c", italic = true }
        hl['@variable.parameter']        = { fg = "#ff7a18", italic = true }
        hl['@variable.member']           = { fg = "#00ffd5" }

        -- 類型與數據
        hl['@type']                      = { fg = "#ffe600", italic = true }
        hl['@type.builtin']              = { fg = "#ffb84d" }
        hl['@type.qualifier']            = { fg = "#ff7a18" }
        hl['@string']                    = { fg = "#00ff85" }
        hl['@string.regexp']             = { fg = "#ff7a18" }
        hl['@string.escape']             = { fg = "#ff003c" }
        hl['@number']                    = { fg = "#b300ff" }
        hl['@boolean']                   = { fg = "#ff4dff", bold = true }
        hl['@constant']                  = { fg = "#00ffd5", bold = true }
        hl['@constant.builtin']          = { fg = "#ff7a18" }

        -- 符號
        hl['@operator']                  = { fg = "#00ffd5" }
        hl['@punctuation.bracket']       = { fg = "#2a2f4a" }
        hl['@punctuation.delimiter']     = { fg = "#4dd2ff" }

        -- 註解（像是「UI提示殘影」）
        hl['@comment']                   = { fg = "#5a607a", italic = true }
        hl['@comment.todo']              = { fg = "#0b0f1a", bg = "#ffe600", bold = true }
        hl['@comment.error']             = { fg = "#0b0f1a", bg = "#ff003c", bold = true }
        hl['@comment.warning']           = { fg = "#0b0f1a", bg = "#ff7a18", bold = true }
        hl['@comment.note']              = { fg = "#0b0f1a", bg = "#4dd2ff", bold = true }

        -- HTML / Tag
        hl['@tag']                       = { fg = "#ff4dff" }
        hl['@tag.builtin']               = { fg = "#b300ff" }
        hl['@tag.attribute']             = { fg = "#ffe600" }
        hl['@tag.delimiter']             = { fg = "#00ffd5" }

        -- 模組
        hl['@module']                    = { fg = "#7df9ff" }
        hl['@attribute']                 = { fg = "#4dd2ff" }
      end
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd [[ colorscheme solarized-osaka ]]
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = "solarized-osaka",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
      },
    },
  },
}
