local sys_info = require("utils.io").get_system_info()
if sys_info.is_windows then
  return {}
end

return {
  "Redoxahmii/json-to-types.nvim",
  build = "sh install.sh npm",
  lazy = true,
}
