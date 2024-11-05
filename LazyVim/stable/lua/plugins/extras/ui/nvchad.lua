return {
  {
    "NvChad/base46",
    -- lazy = true,
    -- event = "VeryLazy",
    build = function()
      require("base46").load_all_highlights()
    end,
    config = function()
      for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
        dofile(vim.g.base46_cache .. v)
      end
    end,
  },
}
