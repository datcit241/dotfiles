local overrides = require("configs.overrides")

return {
  "hrsh7th/nvim-cmp",
  opts = overrides.cmp,

  dependencies = {
    {
      -- snippet plugin
      "L3MON4D3/LuaSnip",
      config = function(_, opts)
        -- load default luasnip config
        require "nvchad.configs.luasnip"

        local luasnip = require "luasnip"
        luasnip.filetype_extend("javascriptreact", { "html" })
        luasnip.filetype_extend("typescriptreact", { "html" })
        require("luasnip/loaders/from_vscode").lazy_load()
      end,
    },

    -- ai based completion
    {
      "jcdickinson/codeium.nvim",
      branch = "main",
      config = function()
        require("codeium").setup {}
      end,
      lazy = false,
    },
  },
}
