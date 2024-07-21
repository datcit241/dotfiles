local nomap = vim.keymap.del

local function safe_nomap(modes, lhs, opts)
  pcall(function()
    nomap(modes, lhs, opts)
  end)
end

return safe_nomap
