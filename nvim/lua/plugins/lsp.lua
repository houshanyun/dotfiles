return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "b0o/schemastore.nvim",
      lazy = true,
    },
    { "williamboman/mason.nvim",           opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
  },
}
