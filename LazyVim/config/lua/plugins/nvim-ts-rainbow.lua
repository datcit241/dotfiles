-- nvim-ts-rainbow is deprecated, use rainbow-delimiters.nvim instead
return {
  "HiPhish/rainbow-delimiters.nvim",
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
  dependencies = { "nvim-treesitter" },
  lazy = true,
  event = "LazyFile",
}

-- return {
--   "p00f/nvim-ts-rainbow",
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
--   lazy = true,
--   event = "LazyFile",
-- }
