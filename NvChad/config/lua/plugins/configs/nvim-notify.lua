return {
  'rcarriga/nvim-notify',
  event = "VeryLazy",
  config = function()
    require("notify").setup({
      background_colour = "#282c34",
      max_width = 80,
      top_down = false,
    })
  end
}
