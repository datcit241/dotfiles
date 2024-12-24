return {
  "nvim-telescope/telescope.nvim",
  optional = true, -- or check LazyVim.has_extra("editor.telescope")
  opts = {
    defaults = {
      mappings = {
        n = {
          ["s"] = "select_vertical",
          ["S"] = "select_horizontal",
        },
      },
      file_ignore_patterns = {
        "node_modules",
      },
    },
  },
}
