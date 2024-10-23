-- lazy.nvim
return {
  "dunix241/url-open.nvim",
  -- dir = "/mnt/f/Projects/url-open.nvim",
  branch = "unstable",
  lazy = true,
  event = "VeryLazy",
  cmd = "URLOpenUnderCursor",
  opts = {
    open_app = "explorer.exe",
  },
  config = function(opts)
    require("url-open").setup(opts)
  end,
}
