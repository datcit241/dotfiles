return {
  "sindrets/diffview.nvim",
  lazy = true,
  keys = {
    {
      "<leader>gd",
      function()
        local lazy = require("diffview.lazy")
        local lib = lazy.require("diffview.lib")
        local view = lib.get_current_view()
        local diffview = require("diffview")
        if view then
          diffview.close()
        else
          diffview.open({})
        end
      end,
      -- "<cmd>DiffviewOpen<CR>",
      desc = "Diff view explorer",
    },
    {
      "<leader>gv",
      "<cmd>DiffviewFileHistory<CR>",
      desc = "View file history",
    },
  },
}
