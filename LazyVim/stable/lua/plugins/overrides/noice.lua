return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts = vim.tbl_deep_extend("force", {}, opts, {
      lsp = {
        signature = {
          enabled = false,
          auto_open = { enabled = false },
        },
        hover = {
          eanbled = true,
          silent = true,
        },
      },
    })
    return opts
  end,
}
