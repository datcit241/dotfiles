local M = {
  base_palette = "catppuccin",
}

M = {
  palette = require("colors.get-palette")(M.base_palette),
  picker_palette = require("colors.get-palette")(M.base_palette),
  neotree_palette = require("colors.get-palette")("onedark"),
  shouldItalizeKeywords = false,
  shouldOverrideKeywords = true,
}

return M
