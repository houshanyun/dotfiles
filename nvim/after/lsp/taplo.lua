return {
  vim.lsp.config("taplo", {
    settings = {
      evenBetterToml = {
        schema = {
          enabled = true,
          repositoryEnabled = true,
        },
      },
    }
  })
}
