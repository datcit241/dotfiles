return {
  recommended = function()
    -- return LazyVim.extras.wants({
    --   ft = {
    --     "javascript",
    --     "javascriptreact",
    --     "javascript.jsx",
    --     "typescript",
    --     "typescriptreact",
    --     "typescript.tsx",
    --   },
    --   root = { "tsconfig.json", "package.json", "jsconfig.json" },
    -- })
  end,

  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
  },
  opts = {
    adapters = {
      "neotest-jest",
      "neotest-vitest",
    },
  },
}
