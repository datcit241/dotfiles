if U.io.get_system_info().is_wsl and vim.fn.executable("wsl-open") == 0 then
  local out = vim.fn.system({ "npm", "install", "-g", "wsl-open" })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to to install wsl-open:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
  end
end
