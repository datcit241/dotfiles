return {
  {
    "isakbm/gitgraph.nvim",
    lazy = true,
    keys = {
      {
        "<leader>gv",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "Git history",
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    -- keys = {
    --   { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    -- },
  },
}
