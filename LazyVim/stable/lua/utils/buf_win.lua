local M = {
  buffer = {},
  window = {},
}

function M.buffer.is_focused(buf)
  local current_buf = vim.api.nvim_get_current_buf()
  return current_buf == buf
end

function M.buffer.get(buffer_name)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf):match(buffer_name) then
      return buf
    end
  end
  return nil
end

function M.buffer.focus(buf)
  if buf then
    vim.api.nvim_set_current_buf(buf)
  else
    print("No buffer found")
  end
end

function M.buffer.try_focusing(buffer_name)
  local buf = M.buffer.get(buffer_name)
  if buf and not M.buffer.is_focused(buf) then
    M.buffer.focus(buf)
    return true
  end
  return false
end

function M.window.is_focused(winid)
  return vim.api.nvim_get_current_win() == winid
end

function M.window.get(buffer_name)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name:match(buffer_name) then
      return win
    end
  end
  return nil
end

function M.window.focus(winid)
  if winid then
    vim.api.nvim_set_current_win(winid)
  else
    print("No window found")
  end
end

function M.window.try_focusing(buffer_name)
  local win = M.window.get(buffer_name)
  if win and not M.window.is_focused(win) then
    M.window.focus(win)
    return true
  end
  return false
end

return M
