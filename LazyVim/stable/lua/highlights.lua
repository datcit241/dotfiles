-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc base30 variable names can also be used as colors

local M = {}

local extra_palette = require("colors.extra-palette")
local opts = require("colors.palette-options")

-- default with italics
-- ["@keyword"] = { italic = shouldItalize, fg = M.colors.cyan },
-- ["@constructor"] = { italic = shouldItalize, fg = M.colors.cyan },
-- Include = { italic = true, fg = M.colors.blue },
---@type Base46HLGroupsList
M.override = {
  NvimTreeGitNew = { fg = opts.palette.green },
  NvimTreeGitStaged = { fg = opts.palette.green },
  NvimTreeGitDirty = { fg = opts.palette.yellow },
  NvimTreeGitRenamed = { fg = opts.palette.yellow },
  NvimTreeGitUnstaged = { fg = opts.palette.red },
  NvimTreeGitDeleted = { fg = opts.palette.danger },

  TelescopeResultsTitle = { fg = opts.picker_palette.dark1, bg = opts.picker_palette.blue },
  TelescopePromptBorder = { fg = opts.picker_palette.red },

  WinSeparator = { fg = extra_palette.gray_500 },

  Comment = { italic = true, fg = opts.palette.light1 },
  ["@comment"] = { italic = true, fg = opts.palette.light1 },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  LineNr = { italic = true, fg = extra_palette.gray_300 },
  CursorLineNr = { fg = opts.palette.yellow },
  Operator = { fg = opts.palette.light3 },

  BufferLineBufferVisible = { fg = opts.palette.dark5 },
  BufferLineBufferSelected = { bold = true, italic = true, fg = opts.palette.violet },
  BufferLineBuffer = { fg = opts.palette.dark2 },
  BufferLineCloseButtonSelected = { fg = opts.palette.red },
  -- BufferLineBackground = { fg = "#abb2bf", bg = opts.palette.dark1 },
  -- BufferLineFill = { fg = "#abb2bf", bg = opts.palette.dark1 },

  NeoTreeExpander = { fg = extra_palette.gray_400 },
  NeoTreeIndentMarker = { fg = extra_palette.gray_500 },
  NeoTreeFileStatsHeader = { italic = true, bold = true, fg = extra_palette.gray_400 },
  NeoTreeFileStats = { fg = extra_palette.gray_500 },
  NeoTreeDotfile = { fg = extra_palette.gray_500 },
  NeoTreeMessage = { italic = true, fg = extra_palette.gray_500 },
  NeoTreeGitAdded = { fg = opts.neotree_palette.green },
  NeoTreeGitStaged = { fg = opts.neotree_palette.green },
  NeoTreeGitModified = { fg = opts.neotree_palette.yellow },
  NeoTreeGitRenamed = { fg = opts.neotree_palette.yellow },
  NeoTreeGitUnstaged = { fg = opts.neotree_palette.red },
  NeoTreeGitUntracked = { fg = opts.neotree_palette.red },
  NeoTreeGitConflict = { italic = true, bold = true, fg = opts.neotree_palette.orange },
  NeoTreeGitDeleted = { fg = opts.neotree_palette.danger },
  NeoTreeTitleBar = { bg = opts.neotree_palette.blue, fg = opts.neotree_palette.dark1 },
  Directory = { fg = opts.neotree_palette.blue },

  Base46Red = { fg = opts.palette.red },
  Base46Yellow = { fg = opts.palette.yellow },
  Base46Blue = { fg = opts.palette.blue },
  Base46Orange = { fg = opts.palette.orange },
  Base46Green = { fg = opts.palette.green },
  Base46Violet = { fg = opts.palette.violet },
  Base46Cyan = { fg = opts.palette.cyan },

  TelescopeResultsBorder = { fg = opts.picker_palette.blue },
  TelescopePreviewBorder = { fg = opts.picker_palette.green },

  FzfLuaBorder = { fg = opts.picker_palette.blue },
  FzfLuaTitle = { fg = opts.palette.dark1, bg = opts.picker_palette.blue },
  FzfLuaPreviewBorder = { fg = opts.picker_palette.green },
  FzfLuaPreviewTitle = { fg = opts.palette.dark1, bg = opts.picker_palette.green },

  GitSignsCurrentLineBlame = { italic = true, fg = extra_palette.gray_400 },

  SagaFileName = { fg = opts.palette.light1 },
  SagaFolderName = { fg = opts.palette.light1 },

  -- ColorColumn = { bg = extra_palette.gray_500 },
  -- NonText = { fg = extra_palette.gray_200 },
  ColorColumn = { bg = extra_palette.gray_800 },
  -- ColorColumn = { bg = "NONE" },
  -- VirtColumn = { bg = extra_palette.gray_600 },
}

if opts.shouldOverrideKeywords then
  M.override = vim.tbl_deep_extend("force", M.override, {
    ["@tag.attribute"] = { italic = opts.shouldItalizeKeywords, fg = opts.palette.red },
    ["@keyword.function"] = { italic = opts.shouldItalizeKeywords, fg = opts.palette.violet },
    ["@keyword.return"] = { italic = opts.shouldItalizeKeywords, fg = opts.palette.violet },
    ["@keyword"] = { italic = opts.shouldItalizeKeywords, fg = opts.palette.violet },
    ["@constructor"] = { italic = opts.shouldItalizeKeywords, fg = opts.palette.violet },
    ["@variable"] = { fg = opts.palette.orange },
    ["@variable.member"] = { fg = opts.palette.red },
    ["@variable.builtin"] = { fg = opts.palette.red },
    Include = { italic = opts.shouldItalizeKeywords, fg = opts.palette.violet },
  })
  M.add = vim.tbl_deep_extend("force", M.add, {
    ["@lsp.mod.defaultLibrary.javascript"] = { fg = opts.palette.red },
    ["@lsp.typemod.method.defaultLibrary.javascript"] = { fg = opts.palette.blue },
  })
end

return M
