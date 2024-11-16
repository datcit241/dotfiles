return {
  "akinsho/git-conflict.nvim",
  lazy = true,
  event = "BufRead",
  version = "*",
  config = true,
  keys = {
    {
      "<leader>gco",
      "<cmd>GitConflictChooseOurs<CR>",
      desc = "Choose ours",
    },
    {
      "<leader>gct",
      "<cmd>GitConflictChooseTheirs<CR>",
      desc = "Choose theirs",
    },
    {
      "<leader>gcb",
      "<cmd>GitConflictChooseBoth<CR>",
      desc = "Choose both",
    },
  },
}
