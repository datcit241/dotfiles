-- return {
--   {
--     "akinsho/toggleterm.nvim",
--     version = "*",
--     config = true,
--     lazy = true,
--   },
--   {
--     "lmburns/lf.nvim",
--     opts = {},
--   },
-- }

return {
  "kevinhwang91/rnvimr",
  lazy = true,
  cmd = { "RnvimrToggle", "RnvimrResize" },
  keys = {
    { "<leader>E", "<CMD>RnvimrToggle<CR>", desc = "Toggle ranger" },
  },
}
