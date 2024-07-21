local map = vim.keymap.set

local error, nvim_tree = pcall(require, "nvim-tree")

if not error then
  map("", "<C-\\>", require("utils.open_file_in_vertical_split"))
  map("", "<C-->", require("utils.open_file_in_horizontal_split"))
  map("", "<C-|>", require("utils.open_file_in_vertical_split"))
  map("", "<C-_>", require("utils.open_file_in_horizontal_split"))
  map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer" })
  map("", "<F5>", function()
    local api = require("nvim-tree.api")
    if api.tree.focus then
      api.tree.reload()
    end
  end)
end
