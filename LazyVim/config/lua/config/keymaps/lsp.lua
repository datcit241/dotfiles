local map = vim.keymap.set

map({ "n", "v" }, "<leader>lf", function()
  require("conform").format({ formatters = { "injected" }, async = true, lsp_fallback = true, timeout_ms = 3000 })
end, { desc = "Format" })
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
map("n", "<leader>lO", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })
map("n", "<leader>lp", "<cmd>Trouble diagnostics<CR>", { desc = "Problems" })
map("n", "<leader>lo", "<cmd>OrganizeImports<CR>", { desc = "Optimize imports" })

-- TODO: trouble definitions/references, diagnostics
-- TODO: jump
