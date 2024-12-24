return {
  -- recommended = function()
  --   return LazyVim.extras.wants({
  --     ft = { "cs", "vb" },
  --     root = { "*.sln", "*.csproj", "omnisharp.json", "function.json" },
  --   })
  -- end,

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "PasiBergman/cmp-nuget",
        opts = {},
      },
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "nuget" })
    end,
  },
}
