return {
  "ibhagwan/fzf-lua",
  optional = true, -- or check LazyVim.has_extra("editor.fzf")
  opts = function()
    local actions = require("fzf-lua.actions")

    return {
      winopts = {
        fullscreen = true, -- start fullscreen?
        preview = {
          vertical = "down:70%", -- up|down:size
          horizontal = "right:60%", -- right|left:size
          layout = "vertical", -- horizontal|vertical|flex
        },
      },
      -- files = {
      --   path_shorten = 1, -- 'true' or number, shorten path?
      --   cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
      --   cwd_prompt_shorten_val = 1,
      -- },
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
