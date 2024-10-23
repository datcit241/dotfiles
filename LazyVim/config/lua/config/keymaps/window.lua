local map = vim.keymap.set

map({ "n" }, "<leader>wn", "<cmd>Telescope notify<CR>", { desc = "Notifications" })
map({ "n" }, "<leader>wd", "<cmd>DBUIToggle<CR>", { desc = "Database" })

map({ "n", "t" }, "<leader>wtt", function()
  require("nvchad.term").new({ pos = "sp", id = "htoggleTerm" })
end, { desc = "Terminal" })
map({ "n", "t" }, "<leader>wtT", function()
  require("nvchad.term").new({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "Vertical terminal" })
map({ "n", "t" }, "<leader>wtf", function()
  require("nvchad.term").new({ pos = "float", id = "floatTerm" })
end, { desc = "Floating terminal" })
map("n", "<leader>wtp", "<cmd>Telescope terms<CR>", { desc = "Pick terminal" })
map("n", "<leader>wT", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
