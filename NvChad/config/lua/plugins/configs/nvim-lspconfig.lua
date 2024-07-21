return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason.nvim",
  },
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require "configs.plugins.lspconfig"
  end,
}
