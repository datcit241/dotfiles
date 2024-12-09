local function get_colors(palette)
  local colors = require("colors.base46." .. palette)
  return colors
end

return get_colors
