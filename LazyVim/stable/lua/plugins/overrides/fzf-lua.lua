return {
  "ibhagwan/fzf-lua",
  optional = true, -- or check LazyVim.has_extra("editor.fzf")
  opts = function()
    local actions = require("fzf-lua.actions")

    return {
      actions = {
        files = {
          true, -- inherit from defaults
          ["ctrl-s"] = actions.file_vsplit,
          ["ctrl-x"] = actions.file_split,
        },
        oldfiles = {
          true, -- inherit from defaults
          ["ctrl-s"] = actions.file_vsplit,
          ["ctrl-x"] = actions.file_split,
        },
        bcommits = {
          true, -- inherit from defaults
          ["ctrl-s"] = actions.file_vsplit,
          ["ctrl-x"] = actions.file_split,
        },
        blame = {
          true, -- inherit from defaults
          ["ctrl-s"] = actions.file_vsplit,
          ["ctrl-x"] = actions.file_split,
        },
        keymaps = {
          true, -- inherit from defaults
          ["ctrl-s"] = actions.file_vsplit,
          ["ctrl-x"] = actions.file_split,
        },
      },
      oldfiles = {
        include_current_session = true,
      },
    }
  end,
}
