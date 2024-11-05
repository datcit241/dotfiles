return {
  "dunix241/url-open.nvim",
  -- dir = "/mnt/f/Projects/url-open.nvim",
  lazy = true,
  event = "BufRead",
  keys = {
    { "gx", "<cmd>URLOpenUnderCursor<cr>", desc = "Open URL under cursor" },
  },
  branch = "unstable",
  cmd = "URLOpenUnderCursor",
  opts = {
    open_app = "wsl-open",
  },
}
