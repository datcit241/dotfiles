local M = {
  colors = {},
  groups = {},
}

local function int_to_hex(int)
  return string.format("#%06x", int)
end

local function get_highlight(name)
  local hl = vim.api.nvim_get_hl(0, { name = name })
  if hl and hl.link then
    return get_highlight(hl.link)
  end
  return hl and hl.fg and int_to_hex(hl.fg) or nil
end

local function get_bg(name)
  local hl = vim.api.nvim_get_hl(0, { name = name })
  if hl and hl.link then
    return get_bg(hl.link)
  end
  return hl and hl.bg and int_to_hex(hl.bg) or nil
end

local highlights = {
  red = "RainbowDelimiterRed",
  yellow = "RainbowDelimiterYellow",
  blue = "RainbowDelimiterBlue",
  orange = "RainbowDelimiterOrange",
  green = "RainbowDelimiterGreen",
  cyan = "RainbowDelimiterCyan",
  violet = "RainbowDelimiterViolet",
  variable = "Variable",
  keyword = "Keyword",
  special = "Special",
  specialChar = "SpecialChar",
  preproc = "PreProc",
  error = "Error",
  character = "Character",
  identifier = "Identifier",
  func = "Function",
  string = "String",
  statement = "Statement",
  fg = "Fg",
}

M.init = function()
  for name, hl in pairs(highlights) do
    M.colors[name] = get_highlight(hl)
    M.groups[name] = hl
  end

  vim.api.nvim_exec_autocmds("User", { pattern = "HighlightsInitiated" })

  local set_hl = vim.api.nvim_set_hl
  local extra_palette = require("colors.extra-palette")
  local bg = get_bg("Normal")

  set_hl(0, "LineNr", { fg = extra_palette.gray_500 })
  set_hl(0, "CursorLineNr", { link = M.groups.orange })

  set_hl(0, "Comment", { italic = true, fg = extra_palette.gray_400 })
  set_hl(0, "@comment", { italic = true, fg = extra_palette.gray_400 })

  set_hl(0, "DirectoryIcon", { link = M.groups.blue })
  set_hl(0, "Directory", { link = "DirectoryIcon" })

  -- set_hl(0, "NeoTreeRootName", { bold = true, italic = true, fg = M.colors.keyword })
  -- set_hl(0, "NeoTreeRootName", { bold = true, italic = true, fg = "#6d71c4", bg = "#24275a" })
  -- set_hl(0, "NeoTreeRootName", { bold = true, italic = true, fg = M.colors.keyword, bg = "#24275a" })
  set_hl(0, "NeoTreeRootName", { link = "DiagnosticVirtualTextWarn" })

  set_hl(0, "NeoTreeTitleBar", { bg = M.colors.keyword, fg = bg })
  set_hl(0, "FloatBorder", { fg = M.colors.keyword })
  set_hl(0, "NeoTreeFileStatsHeader", { italic = true, bold = true, fg = extra_palette.gray_400 })
  set_hl(0, "NeoTreeFileStats", { fg = extra_palette.gray_500 })
  set_hl(0, "NeoTreeDotfile", { fg = extra_palette.gray_500 })
  set_hl(0, "NeoTreeMessage", { italic = true, fg = extra_palette.gray_500 })
  set_hl(0, "NeoTreeGitModified", { link = M.groups.yellow })
  set_hl(0, "NeoTreeGitConflict", { link = M.groups.orange })
  set_hl(0, "NeoTreeGitUntracked", { link = M.groups.red })

  set_hl(0, "@lsp.typemod.method.defaultLibrary.javascriptreact", {}) -- clear highlights

  set_hl(0, "GitSignsChange", { link = M.groups.yellow })
  set_hl(0, "GitSignsCurrentLineBlame", { fg = extra_palette.gray_400 })

  set_hl(0, "BufferLineCloseButtonSelected", { fg = M.colors.red })
  set_hl(0, "BufferLineBufferSelected", { bold = true, italic = true, fg = M.colors.green })
  -- set_hl(0, "BufferLineIndicatorSelected", { bold = true, italic = true, fg = M.colors.orange, bg = "#24275a" })
  set_hl(0, "BufferLineIndicatorSelected", { link = "DiagnosticVirtualTextHint" })
  set_hl(0, "BufferLineFill", { bg = extra_palette.gray_900 })

  set_hl(0, "FzfLuaBorder", { fg = M.colors.func })
  set_hl(0, "FzfLuaTitle", { bg = M.colors.func, fg = bg })
  set_hl(0, "FzfLuaPreviewBorder", { fg = M.colors.string })
  set_hl(0, "FzfLuaPreviewTitle", { bg = M.colors.string, fg = bg })
end

M.get_color = function(color)
  local name = highlights[color]
  local hl = get_highlight(name)
  return hl
end

return M
