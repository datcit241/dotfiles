return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    opts = {
      integrations = {
        markdown = {
          only_render_image_at_cursor = true,
        },
      },
    },
    dependencies = { "luarocks.nvim" },
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = {
  --     filesystem = {
  --       window = {
  --         mappings = {
  --           ["I"] = "image_preview", -- " or another map
  --         },
  --       },
  --       commands = {
  --         image_preview = function(state)
  --           local node = state.tree:get_node()
  --           if node.type == "file" then
  --             require("image_preview").PreviewImage(node.path)
  --           end
  --         end,
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "adelarsq/image_preview.nvim",
  --   lazy = true,
  --   event = "VeryLazy",
  --   -- opts = {},
  --   config = function()
  --     require("image_preview").setup()
  --   end,
  -- },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>yi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}
