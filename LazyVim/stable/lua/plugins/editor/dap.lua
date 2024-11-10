if not LazyVim.has_extra("dap.core") then
  return {}
end

return {
  {
    "Weissle/persistent-breakpoints.nvim",
    opts = { load_breakpoints_event = { "BufRead" } },
    lazy = true,
    event = "BufRead",
  },
}
