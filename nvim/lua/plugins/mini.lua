-- lua/plugins/mini.lua
return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    -- 缩进线颜色
    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#268bd2" })      -- Solarized 蓝
    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbolOff", { fg = "#2d3f76" })   -- 非当前范围，暗蓝

    require("mini.indentscope").setup({
      symbol = "│",
      options = { try_as_border = true },
      draw = {
        delay = 50,
        animation = require("mini.indentscope").gen_animation.cubic({
          easing = "out",
          duration = 80,
          unit = "step",
        }),
      },
    })

    require("mini.icons").setup()
    require("mini.pairs").setup({
      modes = { insert = true, command = false, terminal = false },
      mappings = {
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
        ['"'] = { action = "closeopen", pair = '""', neigh_pattern = '[^\\].' },
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\]." },
        ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\]." },
      },
    })
  end,
}
