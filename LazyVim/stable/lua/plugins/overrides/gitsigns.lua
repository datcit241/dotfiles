return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    opts = vim.tbl_deep_extend("force", opts, {
      current_line_blame = true,
    })

    LazyVim.toggle.map(K.gitsigns_prefix .. "b", {
      name = "inline blame",
      get = function()
        return require("gitsigns.config").config.current_line_blame
      end,
      set = function()
        vim.cmd("Gitsigns toggle_current_line_blame")
      end,
    })

    LazyVim.toggle.map(K.gitsigns_prefix .. "d", {
      name = "deleted",
      get = function()
        return require("gitsigns.config").config.show_deleted
      end,
      set = function()
        vim.cmd("Gitsigns toggle_deleted")
      end,
    })

    LazyVim.toggle.map(K.gitsigns_prefix .. "w", {
      name = "word diff",
      get = function()
        return require("gitsigns.config").config.word_diff
      end,
      set = function()
        vim.cmd("Gitsigns toggle_word_diff")
      end,
    })
    return opts
  end,
}
