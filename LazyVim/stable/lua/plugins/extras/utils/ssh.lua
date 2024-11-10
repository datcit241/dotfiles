return {
  {
    "chipsenkbeil/distant.nvim",
    enabled = false,
    branch = "v0.2",
    config = function()
      require("distant"):setup()
    end,
  },
}
