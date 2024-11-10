-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

_G.U = require("utils")
_G.K = require("config/user_keymaps")

require("config.neovide")

if U.io.get_system_info().is_windows then
  opt.shell = "powershell.exe"
  opt.shellcmdflag = "-command"
  opt.shellquote = '"'
  opt.shellxquote = ""
end

opt.clipboard = ""

-- sync buffers automatically
opt.autoread = true
-- disable neovim generating a swapfile and showing the error
opt.swapfile = false

opt.pumheight = 20 -- limit completion items
opt.pumblend = 20

vim.g.obsidian_vaults = {
  "/home/dunix/projects/notes/Obsidian_Vault/",
  "/home/dunix/projects/notes/Personal_Vault/",
}
