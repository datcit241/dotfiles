-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

_G.Utils = require("utils")

require("utils.io").get_system_info()
if require("utils.io").get_system_info().is_windows then
  opt.shell = "powershell.exe"
  opt.shellcmdflag = "-command"
  opt.shellquote = '"'
  opt.shellxquote = ""
end
