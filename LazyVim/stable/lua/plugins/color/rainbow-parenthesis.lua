-- nvim-ts-rainbow is deprecated, use rainbow-delimiters.nvim instead
return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    event = "BufRead",
    opts = {
      highlight = {
        "RainbowRed", -- #E06C75
        "RainbowYellow", -- #E5C07B
        "RainbowBlue", -- #61AFEF
        "RainbowOrange", -- #D19A66
        "RainbowGreen", -- #98C379
        -- "RainbowViolet", -- #C678DD
        "RainbowCyan", -- #56B6C2
      },
    },
    config = function(_, opts)
      require("rainbow-delimiters.setup").setup(opts)
    end,
    keys = function()
      local snacks = require("snacks")

      snacks
        .toggle({
          name = "rainbow parenthesis",
          get = function()
            local bufnr = vim.api.nvim_get_current_buf()
            return require("rainbow-delimiters").is_enabled(bufnr)
          end,
          set = function(state)
            local bufnr = vim.api.nvim_get_current_buf()
            require("rainbow-delimiters").toggle(bufnr)
          end,
        })
        :map("<leader>SP")
    end,
    dependencies = { "nvim-treesitter" },
  },
  -- {
  --   "p00f/nvim-ts-rainbow",
  --   enabled = false,
  --   lazy = true,
  --   event = "BufRead",
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       rainbow = {
  --         enable = true,
  --         -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  --         extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  --         max_file_lines = nil, -- Do not enable for files with more than n lines, int
  --         colors = {
  --           "#e06c75",
  --           "#E5C07B",
  --           "#61AFEF",
  --           "#D19A66",
  --           "#98C379",
  --           "#C678DD",
  --           "#56B6C2",
  --         },
  --       },
  --     })
  --   end,
  --   dependencies = { "nvim-treesitter" },
  -- },
}
