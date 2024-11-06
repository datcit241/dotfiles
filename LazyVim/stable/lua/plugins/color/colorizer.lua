return {
  "norcalli/nvim-colorizer.lua",
  enabled = false,
  lazy = true,
  event = "BufRead",
  config = function()
    require("colorizer").setup()
  end,
}
