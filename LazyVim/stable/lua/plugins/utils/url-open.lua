local colors = require("colors.palette-options").palette

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
    -- open_app = "wsl-open",
    highlight_url = {
      all_urls = {
        fg = colors.cyan, -- "text" or "#rrggbb"
      },
      cursor_move = {
        fg = colors.blue, -- "text" or "#rrggbb"
      },
    },
  },
}
