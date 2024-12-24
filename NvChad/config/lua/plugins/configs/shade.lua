return {
  "andreadev-it/shade.nvim",
  config = function()
    require("shade").setup {
      overlay_opacity = 85,
      exclude_filetypes = { "NvimTree" },
    }
  end,
  event = "BufWinEnter",
  lazy = true
}
