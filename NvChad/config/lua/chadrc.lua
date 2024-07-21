-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

local highlights = require "highlights"

M.ui = {
  theme = "ashes",
  theme_toggle = {"ashes", "ashes"},

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  statusline = {
    theme = "vscode_colored",
    separator_style = "rounded"
  },
}

return M
