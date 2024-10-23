local map = vim.keymap.set

map({ "n", "v" }, "<leader>lf", function()
  -- LazyVim.format({ force = true })
  require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
end, { desc = "Format" })
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
map("n", "<leader>lO", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })
map("n", "<leader>lpn", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Problems" })
map("n", "<leader>lpb", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Buf Problems" })
map("n", "<leader>lpp", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Workspace Problems" })
-- map("n", "<leader>lpp", "<cmd>Trouble diagnostics<CR>", { desc = "Problems" })
-- map("n", "<leader>lo", "<cmd>OrganizeImports<CR>", { desc = "Optimize imports" })
map("n", "<leader>ld", "<cmd>Trouble lsp<CR>", { desc = "Definitions/References" })

-- TODO: trouble definitions/references, diagnostics
-- TODO: jump
