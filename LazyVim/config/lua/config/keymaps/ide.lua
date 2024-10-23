local map = vim.keymap.set

-- map("n", "<leader>it", "<cmd>Telescope themes<CR>", { desc = "Themes" })
map("n", "<leader>it", "<cmd>lua require('nvchad.themes').open()<CR>", { desc = "Themes" })
map("n", "<leader>ic", "<cmd>NvCheatsheet<CR>", { desc = "NvCheatsheet" })
map("n", "<leader>iw", "<cmd>WhichKey<CR>", { desc = "Whichkey" })
map("n", "<leader>ip", require("utils.open_plugin_page"), { desc = "Visit Plugin" })
map("n", "<leader>isn", function()
  require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Dismiss All Notifications" })
map("n", "<leader>ir", "<cmd>lua require('persistence').load()<CR>", { desc = "Reload session" })
LazyVim.toggle.map("<leader>isd", LazyVim.toggle.diagnostics)
LazyVim.toggle.map("<leader>isf", LazyVim.toggle.format())
LazyVim.toggle.map("<leader>isF", LazyVim.toggle.format(true))
LazyVim.toggle.map("<leader>isT", LazyVim.toggle.treesitter)
if vim.lsp.inlay_hint then
  LazyVim.toggle.map("<leader>ish", LazyVim.toggle.inlay_hints)
end

-- TODO: copy disable autoformat (buffer, cwd), inlay hints, mini pairs, treesitter highlight
