-- tailwind-tools.lua
return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
  },
  {
    "anekos/tailiscope.nvim",
    branch = "fix/support-case-sensitive-filesystems",
    config = function(opts)
      require("telescope").load_extension("tailiscope")
    end,
  },
}
