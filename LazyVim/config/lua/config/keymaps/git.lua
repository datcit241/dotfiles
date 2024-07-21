local map = vim.keymap.set

map("n", "<leader>gg", function()
  --  get file name with extension
  local file = vim.fn.expand("%:t")
  vim.cmd("LazyGit")

  -- Wait a bit for LazyGit to load
  vim.defer_fn(function()
    -- search for the file, highlight, and exit search mode in lazygit
    vim.api.nvim_feedkeys("/" .. file, "t", true)
    vim.api.nvim_input("<CR>")
    vim.api.nvim_input("<ESC>")
  end, 150) -- (milliseconds)
end, { desc = "Lazy git" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>gr", require("gitsigns").reset_hunk, { desc = "Reset Hunk" })
map("n", "<leader>gd", require("gitsigns").preview_hunk, { desc = "Diff" })
map("n", "<leader>gB", LazyVim.lazygit.blame_line, { desc = "Blame" })
map("n", "<leader>gR", LazyVim.lazygit.browse, { desc = "Browse remote" })
map("n", "<leader>gf", function()
  local git_path = vim.api.nvim_buf_get_name(0)
  LazyVim.lazygit({ args = { "-f", vim.trim(git_path) } })
end, { desc = "Lazygit Current File History" })
map("n", "<leader>gg", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })
map("n", "<leader>gl", function()
  LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
end, { desc = "Lazygit Log" })

-- TODO: git hunk integration
