-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = { italic = true, fg = "#BBBBBB" },
  ["@comment"] = { italic = true, fg = "#BBBBBB" },
  NvimTreeGitNew = { fg = "#98C379" },
  NvimTreeGitDeleted = { fg = "#E06C75" },
  NvimTreeGitDirty = { fg = "#E5C07B" },
  NvimTreeGitRenamed = { fg = "#E5C07B" },
  NvimTreeGitStaged = { fg = "#98C379" },
  NvimTreeGitUnstaged = { fg = "#E5C07B" },
  TelescopeResultsTitle = { fg = "#192330", bg = "#61AFEF" },
  TelescopePromptBorder = { fg = "#E06C75" },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  LineNr = { fg = "#D4D4D4" },
  CursorLineNr = { fg = "#E5C07B" },
  Operator = { fg = "#FFFFFF" },
  BufferLineBufferVisible = { fg = "#FFFFFF" },
  BufferLineBufferSelected = { fg = "#FFFFFF" },
  BufferLineBuffer = { fg = "#FFFFFF" },
  BufferLineDiagnostic = { fg = "#FFFFFF" },
  NeoTreeGitUnstaged = { link = "GitSignsDelete" },
  NeoTreeGitUntracked = { link = "GitSignsDelete" },
  RainbowRed = { fg = "#E06C75" },
  RainbowYellow = { fg = "#E5C07B" },
  RainbowBlue = { fg = "#61AFEF" },
  RainbowOrange = { fg = "#D19A66" },
  RainbowGreen = { fg = "#98C379" },
  RainbowViolet = { fg = "#C678DD" },
  RainbowCyan = { fg = "#56B6C2" },
  TelescopeResultsBorder = { fg = "#61AFEF" },
  TelescopePreviewBorder = { fg = "#98C379" },
  URLOpenHighlightCursor = { fg = "#61AFEF" },
  FzfLuaBorder = { fg = "#61AFEF" },
  FzfLuaTitle = { fg = "#192330", bg = "#61AFEF" },
  FzfLuaPreviewBorder = { fg = "#98C379" },
  FzfLuaPreviewTitle = { fg = "#192330", bg = "#98C379" },
}

return M