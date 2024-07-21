return {
  "p00f/nvim-ts-rainbow",
  config = function()
    require("nvim-treesitter.configs").setup({
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {
          "#e06c75",
          "#E5C07B",
          "#61AFEF",
          "#D19A66",
          "#98C379",
          "#C678DD",
          "#56B6C2",
        },
      },
    })
  end,
  dependencies = { "nvim-treesitter" },
  lazy = false,
}
