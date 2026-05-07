return {
  settings = {
    typescript = {
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
        importModuleSpecifier = "non-relative",
      },
      suggest = {
        autoImports = true,
      },
    },
    javascript = {
      preferences = {
        includeCompletionsForModuleExports = true,
      },
      suggest = {
        autoImports = true,
      },
    },
  },
}
