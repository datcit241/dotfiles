-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

local highlights = require("highlights")

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "onedark" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = false,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
