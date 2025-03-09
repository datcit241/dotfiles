return {
  "nvzone/showkeys",
  cmd = "ShowkeysToggle",
  opts = {
    maxkeys = 5,
    -- show_count = true,
  },
  keys = {
    { K.toggle_screenkey, "<cmd>ShowkeysToggle<CR>", desc = "Toggle screenkey" },
  },
}
