local map = vim.keymap.set

map({ "n" }, "<leader>on", "<cmd>Telescope notify<CR>", { desc = "Notifications" })
map({ "n" }, "<leader>od", "<cmd>DBUIToggle<CR>", { desc = "Database" })

map({ "n", "t" }, "<leader>ott", function()
  require("nvchad.term").new({ pos = "sp", id = "htoggleTerm" })
end, { desc = "Terminal" })
map({ "n", "t" }, "<leader>otT", function()
  require("nvchad.term").new({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "Vertical terminal" })
map({ "n", "t" }, "<leader>otf", function()
  require("nvchad.term").new({ pos = "float", id = "floatTerm" })
end, { desc = "Floating terminal" })
map("n", "<leader>otp", "<cmd>Telescope terms<CR>", { desc = "Pick terminal" })
map("n", "<leader>oT", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
map("t", "fj", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
