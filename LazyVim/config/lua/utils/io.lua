-- derived from: https://github.com/Exafunction/codeium.nvim/blob/main/lua/codeium/io.lua

---@class SystemInfo
---@field os string<"linux"|"macos"|"windows">
---@field arch string<"x86_64"|"aarch64"|"arm">
---@field is_arm boolean
---@field is_aarch boolean
---@field is_x86 boolean
---@field is_unix boolean
---@field is_windows boolean
---@field is_wsl boolean

local M = {}

local uv = vim.loop

---@type SystemInfo
local system_info_cache = nil

---@return SystemInfo
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
    require("utils.notify").warn("Unknown sysname: " .. os)
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
    is_wsl = uname.release:lower():find("microsoft") and true or false,
  }
  return system_info_cache
end

---@param url string
---@return string
function M.get_open_command(url)
  local info = M.get_system_info()
  if info.is_windows == "windows" or info.is_wsl then
    if vim.fn.executable("wsl-open") == 0 then
      return "cmd.exe /C start " .. url:gsub("&", "^&")
    end
    return "wsl-open " .. url
  elseif info.os == "linux" then
    return "xdg-open " .. url
  else
    return "open " .. url
  end
end

---@param url string
function M.shell_open(url)
  local command = M.get_open_command(url)
  vim.fn.system(command)
end

return M
