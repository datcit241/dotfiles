local contains = require("utils.contains")

local function select_between_quotes()
  local current_line = vim.api.nvim_get_current_line()
  local len = string.len(current_line)

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local left = col + 1
  local right = col + 1

  local chars = { "'", '"', "`" }

  while (not contains(chars, string.sub(current_line, left, left))) and left > 0 do
    left = left - 1
  end

  while (not contains(chars, string.sub(current_line, right, right))) and right ~= len do
    right = right + 1
  end

  return string.sub(current_line, left + 1, right - 1)
end

return select_between_quotes
