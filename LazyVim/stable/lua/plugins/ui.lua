local snacks = require("snacks")

return {
  {
    "nvim-focus/focus.nvim",
    lazy = true,
    event = "BufRead",
    version = "*",
    opts = {},
    keys = function()
      snacks
        .toggle({
          name = "maximizing window (global)",
          get = function()
            return not require("focus.modules.utils").is_disabled()
          end,
          set = function(state)
            require("focus.modules.functions").focus_toggle()
          end,
        })
        :map("<leader>Sm")

      snacks
        .toggle({
          name = "maximizing window (window)",
          get = function()
            return not vim.w.focus_disable
          end,
          set = function(state)
            vim.w.focus_disable = not state
            Focus.resize()
          end,
        })
        :map("<leader>SM")
    end,
  },
  require("plugins.color"),
  -- Others
  -- "Pocco81/TrueZen.nvim"
  -- "folke/twilight.nvim"
  -- "folke/zen-mode.nvim"
}
