local M = {}

function M.set(mode, lhs, rhs, opts)
  if lhs == "" then
    return
  end

  local modes = type(mode) == "string" and { mode } or mode

  if #modes > 0 then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      ---@diagnostic disable-next-line: no-unknown
      opts.remap = nil
    end
    vim.keymap.set(modes, lhs, rhs, opts)
  end
end

function M.del(modes, lhs, opts)
  pcall(function()
    vim.keymap.del(modes, lhs, opts)
  end)
end

return M
