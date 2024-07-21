return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup()
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
