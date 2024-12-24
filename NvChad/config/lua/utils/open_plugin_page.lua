local select_between_quotes = require("utils.select_between_quotes")

local function open_plugin_page()
  local io = require "codeium.io"
  local notify = vim.notify

  local str = select_between_quotes()

  local is_valid_default_plugin_format = string.match(str, "^[^/]+/[^/]+$")
  local is_valid_url = string.match(str, "[a-z]*://[^ >,;]*")

  if not (is_valid_default_plugin_format or is_valid_url) then
    notify("Invalid Plugin Format", "error")
    return
  end

  local url = is_valid_default_plugin_format and ("https://github.com/" .. str) or str

  local _, err = io.shell_open(url)
  if err then
    vim.pretty_print(err)
    notify("Failed to open default browser", "error")
  end
end

return open_plugin_page
