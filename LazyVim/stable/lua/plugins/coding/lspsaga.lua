return {
  "nvimdev/lspsaga.nvim",
  lazy = true,
  event = "LspAttach",
  keys = {
    { "<leader>lo", "<cmd>Lspsaga outline<CR>", desc = "Outline" },
    { "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line problems" },
    { "<leader>lpp", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line problems" },
    { "<leader>lpb", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Buf problems" },
    { "<leader>lpw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "Workspace problems" },
  },
  opts = {
    lightbulb = {
      sign = false,
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
