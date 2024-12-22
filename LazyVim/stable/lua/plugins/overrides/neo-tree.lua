local k = require("lazyvim.keymaps").get_keymaps()

local command = require("neo-tree.command")
local get_state = function(source_name, winid)
  if source_name == nil then
    local success
    success, source_name = pcall(vim.api.nvim_buf_get_var, 0, "neo_tree_source")
    if not success then
      return nil
    end
  end
  local state = require("neo-tree.sources.manager").get_state(source_name, nil, winid)
  if not state.tree then
    return nil
  end
  if not state._ready then
    return nil
  end
  return state
end

local tree_focused = function(timeout)
  return vim.api.nvim_buf_get_option(0, "filetype") == "neo-tree"
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            -- close on open
            -- vimc.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
      window = {
        mappings = {
          ["C"] = "none",
          ["L"] = {
            function(state)
              local fs = require("neo-tree.sources.filesystem")
              local commands = require("neo-tree.sources.common.commands")
              local node = state.tree:get_node()
              commands.expand_all_nodes(state, node, fs.prefetcher)
            end,
            desc = "Expand nodes recursively",
          },
          ["Z"] = "expand_all_nodes",
          ["H"] = "close_all_subnodes",
          ["E"] = "toggle_auto_expand_width",
        },
      },
      filesystem = {
        window = {
          mappings = {
            [","] = "toggle_hidden",
          },
        },
      },
      git_status = {
        window = {
          mappings = {
            ["A"] = "none",
            ["gu"] = "none",
            ["ga"] = "none",
            ["gr"] = "none",
            ["gc"] = "none",
            ["gp"] = "none",
            ["gg"] = "none",
            ["a"] = "git_add_all",
            ["<space>"] = "git_add_file",
            ["<C-space>"] = "git_unstage_file",
            ["d"] = "git_revert_file",
            ["c"] = "git_commit",
            ["P"] = "git_push",
            ["C"] = "git_commit_and_push",
          },
        },
      },
    },
  },
  {
    "dunix241/neo-tree.nvim",
    keys = {
      {
        k.neotree_toggle_cwd,
        function()
          if not get_state() or not tree_focused() then
            command.execute({ action = "focus", dir = vim.uv.cwd() })
            return
          end
          command.execute({ action = "close" })
        end,
      },
    },
    branch = "feat-add-rename-basename",
    opts = {
      window = {
        mappings = {
          ["O"] = {
            function(state)
              -- require("lazy.util").open(state.tree:get_node().path, { system = true })
              U.io.shell_open(state.tree:get_node().path)
            end,
            desc = "Open with System Application",
          },
          ["E"] = {
            function(state)
              U.io.explorer_open(state.tree:get_node().path)
            end,
            desc = "Open with System Explorer",
          },
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
      },
    },
  },
}
