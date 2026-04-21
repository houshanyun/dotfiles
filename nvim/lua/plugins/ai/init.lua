return {
  -- 這裡可以放 ai 資料夾下主要插件的設定，例如：
  -- { "some-ai-plugin/repo", config = true },

  -- 如果你希望 lazy 同時讀取同目錄下的 supermaven.lua
  -- 你可以選擇在這裡 require 它，或者讓 lazy 自動掃描（見下方第 2 點）
  require("plugins.ai.supermaven"),
}
