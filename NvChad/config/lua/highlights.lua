-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  NvimTreeGitNew = { fg = "#98C379" },
  NvimTreeGitDeleted = { fg = "#E06C75" },
  NvimTreeGitDirty = { fg = "#E5C07B" },
  NvimTreeGitRenamed = { fg = "#E5C07B" },
  NvimTreeGitStaged = { fg = "#98C379" },
  NvimTreeGitUnstaged = { fg = "#E5C07B" },
  TelescopePromptBorder = { fg = "#E06C75" },
  TelescopeBorder = { fg = "#98C379" },
  TelescopeResultsBorder = { fg = "#61AFEF", link = nil}
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
