-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  NvimTreeGitNew = { fg = "#98c379" },
  NvimTreeGitDeleted = { fg = "#e06c75" },
  NvimTreeGitDirty = { fg = "#e5c07b" },
  NvimTreeGitRenamed = { fg = "#e5c07b" },
  NvimTreeGitStaged = { fg = "#98c379" },
  NvimTreeGitUnstaged = { fg = "#e06c75" },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  Comment = { fg = "#abb2bf" },
  LineNr = { fg = "#d4d4d4" },
  CursorLineNr = { fg = "#e5c07b" },
  Operator = { fg = "#ffffff" },
}

return M
