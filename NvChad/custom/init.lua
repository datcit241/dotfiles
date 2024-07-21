local opt = vim.opt
local g = vim.g
local fn = vim.fn
-- local autocmd = vim.api.nvim_create_autocmd

g.mapleader = ","
opt.relativenumber = true

if fn.has('win64') == 1 or fn.has('win32') == 1 or fn.has('win16') == 1 then
  opt.shell = "powershell.exe"
  opt.shellcmdflag="-command"
  opt.shellquote='\"'
  opt.shellxquote=''
end

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
