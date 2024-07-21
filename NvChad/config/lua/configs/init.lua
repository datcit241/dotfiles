local opt = vim.opt

local themes = {
  "ashes",
  "ayu-dark",
  "catppuccine",
  "chadracular-evondev",
  "chadtain",
  "decay",
  "doomchad",
  "everforest",
  "gruvchad",
  "jabuti",
  "kanagawa",
}

vim.notify = function(msg, log_level, options)
  if options and not options.title then
    options.title = debug.getinfo(1).currentline
  end
  return require "notify"(msg, log_level, options)
end

_G.Utils = require "utils"

if Utils.is_windows then
  opt.shell = "powershell.exe"
  opt.shellcmdflag = "-command"
  opt.shellquote = '"'
  opt.shellxquote = ""
end
