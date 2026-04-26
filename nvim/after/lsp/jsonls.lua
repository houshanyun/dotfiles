local schemastore = require("schemastore")
return {
  -- JSON
  vim.lsp.config("jsonls", {
    settings = {
      json = {
        schemas = schemastore.json.schemas(),
        validate = { enable = true },
      },
    },
  })
}
