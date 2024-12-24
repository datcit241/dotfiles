return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    lazy = true,
    ft = { "html", "js", "jsx", "tsx" },
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
    lazy = true,
    ft = { "html", "js", "jsx", "tsx" },
    keys = {
      { "<leader>fT", "<cmd>Telescope tailiscope<cr>", desc = "Find tailwind class" },
    },
    branch = "fix/support-case-sensitive-filesystems",
    config = function()
      require("telescope").load_extension("tailiscope")
    end,
  },
}
