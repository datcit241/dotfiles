local function get_current_file_path()
  local info = debug.getinfo(1, "S")
  local script_path = info.source:sub(2)
  return script_path
end

local current_file_path = get_current_file_path()

local function require_all_modules_in_directory(directory)
  local modules = {}

  local function scan_dir(dir)
    local handle = vim.loop.fs_scandir(dir)
    if not handle then
      return
    end

    while true do
      local name, type = vim.loop.fs_scandir_next(handle)
      if not name then
        break
      end

      local full_path = dir .. "/" .. name
      if full_path ~= current_file_path then
        if type == "directory" then
          scan_dir(full_path)
        elseif name:match("%.lua$") then
          local module_path = full_path:gsub(directory .. "/", ""):gsub("%.lua$", ""):gsub("/", ".")
          table.insert(modules, require("config.keymap_overrides." .. module_path))
        end
      end
    end
  end

  scan_dir(directory)
  return modules
end

return require_all_modules_in_directory(vim.fn.stdpath("config") .. "/lua/config/keymap_overrides")
