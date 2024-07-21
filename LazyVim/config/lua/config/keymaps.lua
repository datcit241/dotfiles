-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- I much prefer putting keymaps in one place to for maintainability, so I disable lazy plugin keys and define my own keymaps here
-- To disable default keymaps see `plugins.core` which specifies the LazyVim `opts.keyfault.keymaps = false` to not import the default LazyVim keymaps and removes the other plugin keymaps by specifying `keys = function() return {} end`
-- If you do want to import LazyVim default keymaps you might want to remove some with vim.keymap.del, have a look at `config.nomaps` for reference
-- But keeping them in one file can be a mess so I just split them into multiple files and require them here

require("config.keymaps.general")
require("config.keymaps.nvimtree")
require("config.keymaps.buffer")
require("config.keymaps.dap")
require("config.keymaps.find")
require("config.keymaps.lsp")
require("config.keymaps.ide")
require("config.keymaps.git")
require("config.keymaps.window")
require("config.keymaps.test")
