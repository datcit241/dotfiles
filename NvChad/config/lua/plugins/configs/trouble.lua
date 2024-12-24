return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  lazy = true,
  config = function()
    require("trouble").setup()
  end,
}
