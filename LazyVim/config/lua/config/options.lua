-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

_G.Utils = require("utils")

if require("utils.io").get_system_info().is_windows then
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
