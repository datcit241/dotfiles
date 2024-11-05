-- tailwind-tools.lua
return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    lazy = true,
    ft = { "html", "typescript", "typescriptreact", "javascript", "javascriptreact" },
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
    lazy = true,
    ft = { "html", "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function(opts)
      require("telescope").load_extension("tailiscope")
    end,
  },
}
