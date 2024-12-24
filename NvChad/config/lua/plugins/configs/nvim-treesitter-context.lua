return {
  "nvim-treesitter/nvim-treesitter-context",
  opts = {mode = "cursor", max_lines = 3},
  lazy = false,
  cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
  event = "VeryLazy",
}
