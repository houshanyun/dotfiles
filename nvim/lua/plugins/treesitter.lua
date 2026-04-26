return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    local ts = require('nvim-treesitter')

    ts.setup({
      install_dir = vim.fn.stdpath('data') .. '/site',
    })

    local ensure = {
      'tsx',
      'typescript',
      'javascript',
      'html',
      'css',
      'json',
      'yaml',
      'lua',
      'vim',
      'vimdoc',
      'markdown',
      'markdown_inline',
    }

    local installed = ts.get_installed()
    local missing = vim.tbl_filter(function(lang)
      return not vim.tbl_contains(installed, lang)
    end, ensure)

    if #missing > 0 then
      ts.install(missing)
    end

    -- ⭐ 改這裡（關鍵）
    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype

        local enable_ft = {
          typescript = true,
          typescriptreact = true,
          javascript = true,
          javascriptreact = true,
          html = true,
          css = true,
          json = true,
          yaml = true,
          lua = true,
          vim = true,
          markdown = true,
        }

        if enable_ft[ft] then
          pcall(vim.treesitter.start, args.buf)
        end
      end,
    })
  end,
}
