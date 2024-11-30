-- install cli tool in prior: https://vi-mongo.com/docs/installation

return {
  "kopecmaciej/vi-mongo.nvim",
  lazy = true,
  cmd = { "ViMongo" },
  keys = {
    { "<leader>om", "<cmd>ViMongo<cr>", desc = "ViMongo" },
  },
  config = function()
    require("vi-mongo").setup()
  end,
}
