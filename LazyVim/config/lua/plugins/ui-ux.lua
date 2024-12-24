return {
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    event = "LazyFile",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    lazy = true,
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "nvim-focus/focus.nvim",
    opts = {},
    lazy = true,
    event = "LazyFile",
    version = "*",
  },
}
