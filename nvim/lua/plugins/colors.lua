return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      ---渲染模式：'background' (您截圖中的效果), 'foreground', 'virtual'
      render = "background",
      ---支援十六進位編碼 (#FFFFFF)
      enable_hex = true,
      ---支援短十六進位 (#fff)
      enable_short_hex = true,
      ---支援 tailwind colors (例如 bg-blue-500)，這對您的 NativeWind 開發非常重要

      enable_tailwind = true,
      ---支援顏色名稱 (例如 'green')
      enable_named_colors = true,

      ---排除特定的檔案類型
      exclude_filetypes = { "lazy", "mason", "help" },
    },
  },

  -- 整合 blink.cmp，讓補全選單也顯示顏色
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          draw = {

            components = {
              kind_icon = {
                text = function(ctx)
                  -- 如果是來自 LSP 的顏色資訊，則顯示顏色方塊
                  if ctx.item.source_name == "LSP" then
                    local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
                      { kind = ctx.kind })

                    if color_item and color_item.abbr ~= "" then
                      return color_item.abbr
                    end
                  end
                  return ctx.kind_icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  -- 設定方塊的顏色高亮
                  if ctx.item.source_name == "LSP" then
                    local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
                      { kind = ctx.kind })
                    if color_item and color_item.abbr_hl_group then
                      return color_item.abbr_hl_group
                    end
                  end
                  return "BlinkCmpKind" .. ctx.kind
                end,
              },
            },
          },
        },
      },
    },
  },
}
