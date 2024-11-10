-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local new_cmd = vim.api.nvim_create_user_command

map({ "i", "v" }, "fj", "<Esc>")
map("n", "fj", "<cmd>noh<CR>")

map("n", "<leader>a", "ggVG", { desc = "Select all" })

-- * is the system clipboard register on Linux and macOS
-- + is the system clipboard register on Windows
map("n", "<leader>ya", "<cmd>%y+<CR>", { desc = "Yank all" })
map("n", "<leader>yy", '"+yy', { desc = "Yank" })
map("v", "<leader>yy", '"+y', { desc = "Yank selected" })
map("n", "<leader>yp", '"+p', { desc = "Paste" })
map("n", "<leader>yP", '"+P', { desc = "Paste" })

map("n", K.comment_toggle, "gcc", { desc = "Comment", remap = true })
map("v", K.comment_toggle, "gc", { desc = "Comment", remap = true })

if not U.io.get_system_info().is_windows then
  new_cmd("SudoWrite", "lua U.sudo.sudo_write()", {})
  map("n", "<leader>pw", "<cmd>lua U.sudo.sudo_write()<cr>", { desc = "Sudo write" })
end

map("n", "<C-p>", function()
  if require("lazyvim.util.pick").want() == "fzf" then
    vim.cmd("FzfLua")
  else
    vim.cmd("Telescope")
  end
end, { desc = "Open command palette" })
