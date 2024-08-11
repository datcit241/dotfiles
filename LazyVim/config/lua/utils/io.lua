-- derived from: https://github.com/Exafunction/codeium.nvim/blob/main/lua/codeium/io.lua

local M = {}

local uv = vim.loop

local system_info_cache = nil
function M.get_system_info()
  if system_info_cache then
    return system_info_cache
  end

  local uname = uv.os_uname()
  local os = uname.sysname

  if os == "Linux" then
    os = "linux"
  elseif os == "Darwin" then
    os = "macos"
  elseif os == "Windows_NT" or string.find(os, "MINGW32_NT") then
    os = "windows"
  else
    require("codeium.notify").warn("Unknown sysname: ", os)
  end

  local arch = uname.machine

  if os == "macos" and arch == "arm64" then
    arch = "aarch64"
  end

  system_info_cache = {
    os = os,
    arch = arch,
    is_arm = arch == "arm",
    is_aarch = arch == "aarch64",
    is_x86 = arch == "x86_64",
    is_unix = os == "linux" or os == "macos",
    is_windows = os == "windows",
  }
  return system_info_cache
end

function M.shell_open(url)
  local info = M.get_system_info()
  if info.os == "linux" then
    return M.get_command_output("xdg-open", url)
  elseif info.os == "macos" then
    return M.get_command_output("/usr/bin/open", url)
  else
    return M.get_command_output("cmd", "/C start " .. url:gsub("&", "^&"))
  end
end

return M
