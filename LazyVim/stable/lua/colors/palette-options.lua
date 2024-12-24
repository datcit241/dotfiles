local M = {
  main_palette = "onedark",
}

M = {
  palette = require("colors.get-palette")("onedark"),
  picker_palette = require("colors.get-palette")(M.main_palette),
  neotree_palette = require("colors.get-palette")("onedark"),
  shouldItalizeKeywords = false,
}

return M
