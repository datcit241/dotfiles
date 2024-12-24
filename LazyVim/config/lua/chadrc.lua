-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig

local highlights = require("highlights")

-- local M = {}
-- M.ui = {
--   theme = "vscode_dark",
--   theme_toggle = { "vscode_dark", "catpuccin" },
--
--   hl_override = highlights.override,
--   hl_add = highlights.add,
--   transparency = false,
--
--   -- hl_override = {
--   -- 	Comment = { italic = true },
--   -- 	["@comment"] = { italic = true },
--   -- },
-- }

local options = {
  base46 = {
    theme = "nightfox", -- default theme
    hl_add = highlights.add,
    hl_override = highlights.override,
    integrations = {},
    changed_themes = {},
    transparency = false,
    theme_toggle = { "nightfox", "onenord" },
  },

  ui = {
    --   statusline = {
    --     enabled = false,
    --   },
  },
}

return options
