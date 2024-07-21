local fn = vim.fn

return fn.has "win64" == 1 or fn.has "win32" == 1 or fn.has "win16" == 1
