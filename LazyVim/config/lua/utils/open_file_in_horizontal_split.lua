local function open_file_in_horizontal_split()
  local api = require("nvim-tree.api")
  if api.tree.focus then
    api.node.open.horizontal()
    return
  end
  local actions = require("telescope.actions")
  vim.notify(actions)
end

return open_file_in_horizontal_split
