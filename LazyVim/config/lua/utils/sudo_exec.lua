local function sudo_exec(cmd, print_output)
vim.fn.inputsave()
local password = vim.fn.inputsecret("Password: ")
vim.fn.inputrestore()
if not password or #password == 0 then
  vim.notify("Invalid password, sudo aborted", vim.log.levels.WARN)
  return false
end
local out = vim.fn.system(string.format("sudo -p '' -S %s", cmd), password)
if vim.v.shell_error ~= 0 then
  print("\r\n")
  vim.notify("out", vim.log.levels.ERROR)
  return false
end
if print_output then print("\r\n", out) end
return true
end

return sudo_exec
