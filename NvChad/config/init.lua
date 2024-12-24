local g = vim.g
local opt = vim.opt
local fn = vim.fn

g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(g.base46_cache .. "defaults")
dofile(g.base46_cache .. "statusline")

require "nvchad.autocmds"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

require "configs"
