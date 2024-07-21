return {
  "norcalli/nvim-colorizer.lua",
  lazy = true,
  event = "LazyFile",
  config = function()
    require("colorizer").setup()
  end,
}
