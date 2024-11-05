local actions = require("fzf-lua.actions")
return {
  "ibhagwan/fzf-lua",
  opts = {
    actions = {
      files = {
        true, -- inherit from defaults
        ["ctrl-s"] = actions.file_vsplit,
      },
      oldfiles = {
        true, -- inherit from defaults
        ["ctrl-s"] = actions.file_vsplit,
      },
      bcommits = {
        true, -- inherit from defaults
        ["ctrl-s"] = actions.file_vsplit,
      },
      blame = {
        true, -- inherit from defaults
        ["ctrl-s"] = actions.file_vsplit,
      },
      keymaps = {
        true, -- inherit from defaults
        ["ctrl-s"] = actions.file_vsplit,
      },
    },
  },
}
