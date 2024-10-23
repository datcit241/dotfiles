return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.spec = {
      {
        mode = { "n", "v" },
        { "<leader>c", group = nil },
        { "<leader>d", group = "Debug" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>i", group = "IDE" },
        { "<leader>is", group = "Settings" },
        { "<leader>l", group = "Lsp" },
        { "<leader>mc", group = "Multicursors" },
        { "<leader>t", group = "Test" },
        { "<leader>w", group = "Window" },
        { "<leader>wt", group = "Terminal" },
        { "<leader>y", group = "System clipboard" },
      },
    }
    return opts
  end,
}
