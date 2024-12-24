return {
  "norcalli/nvim-colorizer.lua",
  event = "BufRead",
  lazy = true,
  config = function()
    require("colorizer").setup()
  end,
}
