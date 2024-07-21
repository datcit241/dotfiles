return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = function()
    return require("config.plugin.nvimtree")
  end,
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}
