return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.spec = {
      {
        mode = { "n", "v" },
        { "<leader>l", group = "Lsp" },
        { "<leader>c", group = nil },
        { "<leader>i", group = "IDE" },
        { "<leader>is", group = "Settings" },
        { "<leader>g", group = "Git" },
        { "<leader>t", group = "Test" },
        { "<leader>f", group = "Find" },
        { "<leader>d", group = "Debug" },
        { "<leader>w", group = "Window" },
        { "<leader>wt", group = "Terminal" },
      },
    }
    return opts
  end,
}
