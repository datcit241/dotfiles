return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  opts = function()
    return require("config.plugin.nvimtree")
  end,
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
}
