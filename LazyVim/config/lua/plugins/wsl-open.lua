-- https://gitlab.com/4U6U57/wsl-open

if vim.fn.executable("wsl-open") == 0 then
  local out = vim.fn.system({ "npm", "install", "-g", "wsl-open" })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to to install wsl-open:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
  end
end

return {}
