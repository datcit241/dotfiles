return {
  "karb94/neoscroll.nvim",
  lazy = true,
  keys = { "<C-d>", "<C-u>" },
  config = function()
    require("neoscroll").setup()
  end,
}
