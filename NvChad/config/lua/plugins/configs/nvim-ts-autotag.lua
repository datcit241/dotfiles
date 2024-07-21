return {
  "windwp/nvim-ts-autotag",
  event = "VeryLazy",
  config = function()
    require "configs.plugins.nvim-ts-autotag"
  end,
  lazy = true,
}
