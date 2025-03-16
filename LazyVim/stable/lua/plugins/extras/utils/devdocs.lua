return {
  "maskudo/devdocs.nvim",
  lazy = false,
  dependencies = {
    "folke/snacks.nvim",
  },
  cmd = { "DevDocs" },
  opts = {
    ensure_installed = {
      "html",
      "css",
      "javascript",
      "typescript",
      "react",
      "react_router",
      "moment",
      "tailwindcss",
      "lodash~4",
      "dom",
      "nextjs",
      -- "eslint",
      -- "sass",
      -- "vue",
      -- "svelte",
      -- "astro",
      -- "vite",
      -- "webpack~5",
      -- "esbuild",
      -- "lua~5.1",
      -- "http",
      "bash",
      "docker",
      "nginx",
      "node",
      -- "express",
      -- "latex",
      -- "go",
      -- "rust",
      -- "redis",
    },
  },
  keys = {
    {
      "<leader>pd",
      mode = "n",
      function()
        local devdocs = require("devdocs")
        local installedDocs = devdocs.GetInstalledDocs()
        vim.ui.select(installedDocs, {}, function(selected)
          if not selected then
            return
          end
          local docDir = devdocs.GetDocDir(selected)
          -- prettify the filename as you wish
          Snacks.picker.files({ cwd = docDir })
        end)
      end,
      desc = "Get Devdocs",
    },
  },
}
