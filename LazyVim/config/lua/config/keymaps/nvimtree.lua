local map = vim.keymap.set

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

local error, nvim_tree = pcall(require, "nvim-tree")
if not error and type(nvim_tree) ~= "string" then
  vim.notify("nvim_tree" .. vim.inspect(nvim_tree))
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
else
  local command = require("neo-tree.command")
  map("n", "<leader>e", function()
    if not get_state() or not tree_focused() then
      command.execute({ action = "focus", dir = vim.uv.cwd() })
      return
    end
    command.execute({ action = "close" })
  end, { desc = "Explorer" })
  map("n", "<leader>ge", function()
    command.execute({ source = "git_status", toggle = true })
  end, { desc = "Git Explorer" })
end
