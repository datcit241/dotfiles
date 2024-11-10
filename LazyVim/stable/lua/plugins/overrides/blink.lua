if not LazyVim.has_extra("coding.blink") then
  return {}
end

return {
  "saghen/blink.cmp",
  opts = {
    windows = {
      autocomplete = {
        max_height = 20,
      },
    },
  },
}
