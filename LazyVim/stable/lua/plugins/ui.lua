return {
  {
    "nvim-focus/focus.nvim",
    lazy = true,
    event = "BufRead",
    version = "*",
    opts = {},
    keys = function()
      LazyVim.toggle.map("<leader>Sm", {
        name = "maximizing window (global)",
        get = function()
          return not require("focus.modules.utils").is_disabled()
        end,
        set = function(state)
          require("focus.modules.functions").focus_toggle()
        end,
      })

      LazyVim.toggle.map("<leader>SM", {
        name = "maximizing window (window)",
        get = function()
          return not vim.w.focus_disable
        end,
        set = function(state)
          vim.w.focus_disable = not state
          Focus.resize()
        end,
      })
    end,
  },
  require("plugins.color"),
  -- Others
  -- "Pocco81/TrueZen.nvim"
  -- "folke/twilight.nvim"
  -- "folke/zen-mode.nvim"
}
