local map = vim.keymap.set

map("n", "<leader>it", "<cmd>Telescope themes<CR>", { desc = "Themes" })
map("n", "<leader>ic", "<cmd>NvCheatsheet<CR>", { desc = "NvCheatsheet" })
map("n", "<leader>iw", "<cmd>WhichKey<CR>", { desc = "Whichkey" })
map("n", "<leader>ip", require("utils.open_plugin_page"), { desc = "Visit Plugin" })
map("n", "<leader>isn", function()
  require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Dismiss All Notifications" })
map("n", "<leader>ir", "<cmd>lua require('persistence').load()<CR>", { desc = "Reload session" })

-- TODO: copy disable autoformat (buffer, cwd), inlay hints, mini pairs, treesitter highlight
