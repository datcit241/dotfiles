return {
  "tpope/vim-fugitive",
  lazy = true,
  event = "BufRead",
  keys = {
    {
      "<leader>gb",
      "<cmd>Git blame<CR>",
      desc = "Blame",
    },
    {
      "<leader>gcc",
      "<cmd>Gvdiffsplit!<CR>",
      desc = "Conflict diff view",
    },
    {
      "<leader>gcg",
      ":diffget ",
      desc = "Get diff from",
    },
    {
      "<leader>gcp",
      ":diffput ",
      desc = "Put diff to target",
    },
  },
}
