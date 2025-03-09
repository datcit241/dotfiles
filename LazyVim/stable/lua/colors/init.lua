local M = {
  colors = {},
  groups = {},
}

local function int_to_hex(int)
  return string.format("#%06x", int)
end

local get_highlight = function(name)
  local hl = vim.api.nvim_get_hl(0, { name = name })
  return hl and hl.fg and int_to_hex(hl.fg) or nil
end

local highlights = {
  red = "RainbowDelimiterRed",
  yellow = "RainbowDelimiterYellow",
  blue = "Function",
  orange = "RainbowDelimiterOrange",
  green = "RainbowDelimiterGreen",
  cyan = "RainbowDelimiterCyan",
  violet = "Keyword",
  special = "Special",
  error = "Error",
  character = "Character",
  identifier = "Identifier",
}

M.init = function()
  for name, hl in pairs(highlights) do
    M.colors[name] = get_highlight(hl)
    M.groups[name] = hl
  end

  vim.api.nvim_exec_autocmds("User", { pattern = "HighlightsInitiated" })
end

M.get_color = function(color)
  local name = highlights[color]
  local hl = get_highlight(name)
  return hl
end

return M
