return {
  {
    "shellRaining/hlchunk.nvim",
    lazy = true,
    event = "BufRead",
    keys = {
      { "<leader>Si", "", desc = "Indent rainbow" },
    },
    opts = {
      indent = {
        enable = false,
      },
      blank = {
        enable = true,
      },
    },
  },
}
