return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup({
      openai_api_key = os.getenv("OPENAI_API_KEY"),
      model = "gpt-4o-mini",
      chat_dir = vim.fn.stdpath("data") .. "/gp/chats",
      style = "popup",
    })
  end,
}
