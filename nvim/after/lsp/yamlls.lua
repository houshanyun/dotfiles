local schemastore = require("schemastore")
return {

  -- YAML
  vim.lsp.config("yamlls", {
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = schemastore.yaml.schemas(),
      },
    },
  })

}
