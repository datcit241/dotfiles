local chadrc = require("chadrc")
local enabled = chadrc.base46 and not chadrc.base46.transparency

return {
  "folke/drop.nvim",
  enabled = enabled,
  opts = {
    theme = "snow", -- xmas | halloween | snow | new_year | bugs | valentines_day | winter_wonderland | summer | leaves | emotional | easter | cats | candy | april_fools
    -- theme = { -- custom theme
    --   symbols = {
    --     "I",
    --     "love",
    --     "you",
    --     "💖",
    --     "💘",
    --     "💝",
    --     "💕",
    --     "💓",
    --     "💞",
    --     "💟",
    --     "💌",
    --     "🌹",
    --     "🍫",
    --     "💐",
    --     "💍",
    --     "🍷",
    --     "🕯️",
    --   },
    --   colors = { "#FF6B8D", "#FFB6C1", "#DD2A7B", "#FFD1DC", "#8B0000" },
    -- },
    max = 100,
    interval = 100,
    screensaver = 1000 * 5, -- in milliseconds
    filetypes = { "dashboard", "alpha", "ministarter" }, -- will enable/disable automatically for the following filetypes
  },
  config = function(_, opts)
    require("drop").setup(opts)
    local snacks = require("snacks")

    snacks
      .toggle({
        name = "drop",
        get = function()
          return require("drop.drop").timer and true or false
        end,
        set = function(state)
          local drop = require("drop")
          if state then
            if opts.screensaver then
              require("drop.config").screensaver = opts.screensaver
            end
            drop.show()
          else
            drop.hide()
            if opts.screensaver then
              require("drop.config").screensaver = false
            end
          end
        end,
      })
      :map("<leader>SD")
  end,
}
