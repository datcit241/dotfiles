return {
  require("plugins.overrides.blink"),
  require("plugins.overrides.bufferline"),
  require("plugins.overrides.flash"),
  require("plugins.overrides.fzf-lua"),
  require("plugins.overrides.gitsigns"),
  require("plugins.overrides.mini-pairs"),
  require("plugins.overrides.neo-tree"),
  require("plugins.overrides.noice"),
  require("plugins.overrides.nvim-cmp"),
  require("plugins.overrides.nvim-dap-ui"),
  require("plugins.overrides.nvim-notify"),
  require("plugins.overrides.telescope"),
  require("plugins.overrides.which-key"),
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    enabled = false,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
}