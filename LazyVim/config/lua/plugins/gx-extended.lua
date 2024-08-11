return {
  "rmagatti/gx-extended.nvim",
  lazy = true,
  keys = { "gx" },
  opts = {
    extensions = {
      { -- match github repos in lazy.nvim plugin specs
        patterns = { "*/plugins/**/*.lua" },
        name = "neovim plugins",
        match_to_url = function(line_string)
          local line = string.match(line_string, "[\"|'].*/.*[\"|']")
          local repo = vim.split(line, ":")[1]:gsub("[\"|']", "")
          local url = "https://github.com/" .. repo
          return line and repo and url or nil
        end,
      },
    },
    open_fn = require("lazy.util").open,
  },
}
