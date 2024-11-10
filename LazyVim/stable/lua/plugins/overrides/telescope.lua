if not LazyVim.has_extra("editor.telescope") then
  return {}
end

return {
  "nvim-telescope/telescope.nvim",
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
