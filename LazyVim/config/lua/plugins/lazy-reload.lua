return {
  "MaximilianLloyd/lazy-reload.nvim",
  opts = {},
  lazy = true,
  cmd = "ReloadPlugin",
  keys = {
    { "<leader>pr", "<cmd>lua require('lazy-reload').feed()<cr>", desc = "Reload a plugin" },
  },
}