local M = {}

local function notify_at_level(name, level)
  return function(message, opts)
    vim.notify(message, level, opts or { title = name })
  end
end

M.trace = notify_at_level("trace", vim.log.levels.TRACE)
M.debug = notify_at_level("debug", vim.log.levels.DEBUG)
M.info = notify_at_level("info", vim.log.levels.INFO)
M.warn = notify_at_level("warn", vim.log.levels.WARN)
M.error = notify_at_level("error", vim.log.levels.ERROR)

return M
