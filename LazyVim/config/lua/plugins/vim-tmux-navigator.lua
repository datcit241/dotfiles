-- return {
--   "christoomey/vim-tmux-navigator",
--   cmd = {
--     "TmuxNavigateLeft",
--     "TmuxNavigateDown",
--     "TmuxNavigateUp",
--     "TmuxNavigateRight",
--     "TmuxNavigatePrevious",
--   },
--   lazy = true,
--   keys = {
--     { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
--     { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
--     { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
--     { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
--     { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
--   },
-- }

return {
  "numToStr/Navigator.nvim",
  opts = {},
  lazy = true,
  cmd = {
    "NavigatorLeft",
    "NavigatorRight",
    "NavigatorUp",
    "NavigatorDown",
  },
  keys = {
    { "<c-h>", "<cmd>NavigatorLeft<cr>" },
    { "<c-j>", "<cmd>NavigatorDown<cr>" },
    { "<c-k>", "<cmd>NavigatorUp<cr>" },
    { "<c-l>", "<cmd>NavigatorRight<cr>" },
    { "<c-\\>", "<cmd>NavigatorPrevious<cr>" },
  },
}
