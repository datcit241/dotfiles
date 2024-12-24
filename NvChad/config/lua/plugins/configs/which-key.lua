return {
  "folke/which-key.nvim",
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)
    local present, wk = pcall(require, "which-key")

    if not present then
      return
    end
    local config = require "configs.plugins.whichkey"
    wk.register(config)
  end,
  setup = function()
    require("core.utils").load_mappings "whichkey"
  end,
}
