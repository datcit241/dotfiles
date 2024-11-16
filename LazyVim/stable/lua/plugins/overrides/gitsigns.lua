local snacks = require("snacks")

return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true, -- similar: https://github.com/braxtons12/blame_line.nvim
  },
  keys = function(_, keys)
    snacks
      .toggle({
        name = "inline blame",
        get = function()
          return require("gitsigns.config").config.current_line_blame
        end,
        set = function()
          vim.cmd("Gitsigns toggle_current_line_blame")
        end,
      })
      :map(K.gitsigns_prefix .. "b")

    snacks
      .toggle({
        name = "deleted",
        get = function()
          return require("gitsigns.config").config.show_deleted
        end,
        set = function()
          vim.cmd("Gitsigns toggle_deleted")
        end,
      })
      :map(K.gitsigns_prefix .. "d")

    snacks
      .toggle({
        name = "word diff",
        get = function()
          return require("gitsigns.config").config.word_diff
        end,
        set = function()
          vim.cmd("Gitsigns toggle_word_diff")
        end,
      })
      :map(K.gitsigns_prefix .. "w")
    return keys
  end,
}
