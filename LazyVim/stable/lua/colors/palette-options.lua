local M = {
  main_palette = "everforest",
}

M = {
  palette = require("colors.get-palette")("nightfox"),
  picker_palette = require("colors.get-palette")(M.main_palette),
  neotree_palette = require("colors.get-palette")("nightfox"),
  shouldItalizeKeywords = false,
}

return M
