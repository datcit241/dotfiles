return {
  "olimorris/codecompanion.nvim",
  -- lazy = true,
  -- cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionCmd", "CodeCompanionActions" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  -- config = true,
  opts = {
    display = {
      diff = {
        provider = "mini_diff",
      },
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          env = {
            api_key = function()
              return os.getenv("COPILOT_API_KEY")
            end,
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
  end,
}
