-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

local highlights = require("highlights")

---@type ChadrcConfig
local options = {
  base46 = {
    theme = require("colors.palette-options").base_palette, -- default theme
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
