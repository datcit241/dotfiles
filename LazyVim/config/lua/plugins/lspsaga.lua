return {
  "nvimdev/lspsaga.nvim",
  opts = {
    lightbulb = {
      sign = false,
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  lazy = true,
  event = "LspAttach",
}
