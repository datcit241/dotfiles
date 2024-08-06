local map = vim.keymap.set

local error, nvim_tree = pcall(require, "nvim-tree")

if not error then
  map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer" })
  map("", "<C-\\>", require("utils.open_file_in_vertical_split"))
  map("", "<C-->", require("utils.open_file_in_horizontal_split"))
  map("", "<C-|>", require("utils.open_file_in_vertical_split"))
  map("", "<C-_>", require("utils.open_file_in_horizontal_split"))
  map("", "<F5>", function()
    local api = require("nvim-tree.api")
    if api.tree.focus then
      api.tree.reload()
    end
  end)
end

local tree_focused = function(timeout)
  return vim.api.nvim_buf_get_option(0, "filetype") == "neo-tree"
end

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

if error then
  map("n", "<leader>e", function()
    if not get_state() or not tree_focused() then
      require("neo-tree.command").execute({ action = "focus", dir = LazyVim.root() })
      return
    end
    require("neo-tree.command").execute({ action = "close" })
  end, { desc = "Explorer" })
  map("n", "<leader>ge", function()
    require("neo-tree.command").execute({ source = "git_status", toggle = true })
  end, { desc = "Git Explorer" })
end
