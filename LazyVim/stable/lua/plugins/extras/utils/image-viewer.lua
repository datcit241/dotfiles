return {
  {
    "3rd/image.nvim",
    opts = {
      integrations = {
        markdown = {
          only_render_image_at_cursor = true,
        },
      },
    },
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
}
