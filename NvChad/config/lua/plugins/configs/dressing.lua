return {
  "stevearc/dressing.nvim",
  config = function()
    require("configs.plugins.dressing").setup()
  end,
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "VeryLazy",
}
