if not LazyVim.has_extra("coding.codeium") then
  return {}
end

return {
  "Exafunction/codeium.nvim",
  opts = {
    enable_chat = true,
  },
}
