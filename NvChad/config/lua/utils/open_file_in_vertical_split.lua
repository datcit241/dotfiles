local function open_file_in_vertical_split()
  local api = require("nvim-tree.api")
  if api.tree.focus then
    api.node.open.vertical()
    return
  end
end

return open_file_in_vertical_split
