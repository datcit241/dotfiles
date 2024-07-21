local map = vim.keymap.set

map("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })
map("n", "<leader>n", "<cmd>enew<CR>", { desc = "New" })
