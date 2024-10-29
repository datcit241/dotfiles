return {
  -- {
  --   "smoka7/multicursors.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvimtools/hydra.nvim",
  --   },
  --   opts = {},
  --   cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  --   keys = {
  --     {
  --       mode = { "v", "n" },
  --       "<Leader>mcv",
  --       "<cmd>MCunderCursor<cr>",
  --       desc = "Select the char under the cursor",
  --     },
  --     {
  --       mode = { "n" },
  --       "<Leader>mc/",
  --       "<cmd>MCpattern<cr>",
  --       desc = "Select with pattern",
  --     },
  --     {
  --       mode = { "v" },
  --       "<Leader>mc/",
  --       "<cmd>MCvisualPattern<cr>",
  --       desc = "Select with pattern",
  --     },
  --     {
  --       mode = { "v" },
  --       "<Leader>mcd",
  --       "<cmd>MCclear<cr>",
  --       desc = "Clear all selections",
  --     },
  --   },
  -- },
  {
    "jake-stewart/multicursor.nvim",
    lazy = true,
    opts = {},
    keys = function()
      local mc = require("multicursor-nvim")
      local toggle_cursors = function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        elseif mc.hasCursors() then
          mc.clearCursors()
        end
      end

      return {
        { "m", "", desc = "Multicursors", mode = { "n", "v" } },
        {
          mode = { "n", "v" },
          "<up>",
          function()
            mc.lineAddCursor(-1)
          end,
          desc = "Add cursor above",
        },
        {
          mode = { "n", "v" },
          "<down>",
          function()
            mc.lineAddCursor(1)
          end,
          desc = "Add cursor below",
        },
        {
          mode = { "n", "v" },
          "m<up>",
          function()
            mc.lineSkipCursor(-1)
          end,
          desc = "Skip cursor above",
        },
        {
          mode = { "n", "v" },
          "m<down>",
          function()
            mc.lineSkipCursor(1)
          end,
          desc = "Skip cursor below",
        },
        {
          mode = { "n" },
          "<c-leftmouse>",
          mc.handleMouse,
          desc = "Add cursor",
        },
        {
          mode = { "n", "v" },
          "mc<space>",
          mc.toggleCursor,
          desc = "Toggle cursor",
        },
        {
          mode = { "n", "v" },
          "mc#",
          function()
            mc.matchAddCursor(-1)
          end,
          desc = "Add cursor to previous match",
        },
        {
          mode = { "n", "v" },
          "mc*",
          function()
            mc.matchAddCursor(1)
          end,
          desc = "Add cursor to next match",
        },
        {
          mode = { "n", "v" },
          "mca",
          mc.matchAllAddCursor,
          desc = "Add all matches",
        },
        {
          mode = { "n", "v" },
          "mc3",
          function()
            mc.matchSkipCursor(-1)
          end,
          desc = "Skip previous match",
        },
        {
          mode = { "n", "v" },
          "mc8",
          function()
            mc.matchSkipCursor(1)
          end,
          desc = "Skip next match",
        },
        {
          mode = { "n" },
          "<CR>",
          toggle_cursors,
          desc = "Toggle cursors",
        },
        {
          mode = { "v" },
          "mc/",
          mc.matchCursors,
          desc = "Place cursors at matches",
        },
        {
          mode = { "n", "v" },
          "mcx",
          mc.deleteCursor,
          desc = "Delete cursor",
        },
        {
          mode = { "n", "v" },
          "<left>",
          mc.nextCursor,
          desc = "Next",
        },
        {
          mode = { "n", "v" },
          "<right>",
          mc.prevCursor,
          desc = "Previous",
        },
        {
          mode = { "n", "v" },
          "mcg",
          mc.firstCursor,
          desc = "First",
        },
        {
          mode = { "n", "v" },
          "mcG",
          mc.lastCursor,
          desc = "Last",
        },
        {
          mode = { "n", "v" },
          "mcl",
          mc.disableCursors,
          desc = "Lock cursors",
        },
        {
          mode = { "n", "v" },
          "mcu",
          mc.enableCursors,
          desc = "Unlock cursors",
        },
        {
          mode = { "n", "v" },
          "mcd",
          mc.duplicateCursors,
          desc = "Duplicate cursors",
        },
        {
          mode = { "n", "v" },
          "mca",
          mc.alignCursors,
          desc = "Align cursors",
        },
        {
          mode = { "n" },
          "gmc",
          mc.restoreCursors,
          desc = "Restore cursors",
        },
        {
          mode = { "v" },
          "mcs",
          mc.splitCursors,
          desc = "Split cursors",
        },
        {
          mode = { "v" },
          "mcI",
          mc.insertVisual,
          desc = "Insert visual",
        },
        {
          mode = { "v" },
          "mcA",
          mc.appendVisual,
          desc = "Append visual",
        },
        -- {
        --   mode = { "v" },
        --   "mct",
        --   function()
        --     mc.transposeCursors(-1)
        --   end,
        --   desc = "Rotate visual selection contents",
        -- },
        -- {
        --   mode = { "v" },
        --   "mcT",
        --   function()
        --     mc.transposeCursors(1)
        --   end,
        --   desc = "Rotate visual selection contents",
        -- },
      }
    end,
  },
}

-- return {}
