return {
  "saghen/blink.cmp",
  optional = true,
  dependencies = {
    "mikavilpas/blink-ripgrep.nvim",
    -- 👆🏻👆🏻 add the dependency here

    -- optional dependency used for toggling features on/off
    -- https://github.com/folke/snacks.nvim
    "folke/snacks.nvim",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      default = {
        "ripgrep", -- 👈🏻 add "ripgrep" here
      },
      providers = {
        -- 👇🏻👇🏻 add the ripgrep provider config below
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
        },
      },
    },
  },
}
