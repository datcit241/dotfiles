return {
  "saghen/blink.cmp",
  optional = true, -- or check LazyVim.has_extra("coding.blink")
  opts = {
    completion = {
      menu = {
        max_height = 20,
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
    },
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
  },
  keys = {
    {
      "<tab>",
      function()
        require("luasnip").jump(1)
      end,
      mode = "s",
    },
    {
      "<s-tab>",
      function()
        require("luasnip").jump(-1)
      end,
      mode = { "i", "s" },
    },
    {
      "<c-d>",
      function()
        local list = require("blink.cmp.completion.list")
        local max_height = require("blink.cmp.config").completion.menu.max_height

        if #list.items == 0 or list.context == nil then
          return
        end

        -- haven't selected anything yet, select the first item, if cycling enabled
        if list.selected_item_idx == nil then
          local dest = math.floor(max_height / 2)
          return list.select(dest > #list.items and #list.items or dest)
        end

        -- end of the list
        if list.selected_item_idx == #list.items then
          -- preselect is not enabled, we go back to no selection
          if not list.get_selection_mode(list.context).preselect then
            return list.select(nil)
          end

          -- cycling around has been disabled, ignore
          if not list.config.cycle.from_bottom then
            return
          end

          -- otherwise, we cycle around
          return list.select(1)
        end

        -- typical case, select the next item
        local dest = math.floor(list.selected_item_idx + max_height / 2)
        list.select(dest > #list.items and #list.items or dest)
      end,
      mode = { "i", "s" },
    },
    {
      "<c-u>",
      function()
        local list = require("blink.cmp.completion.list")
        local max_height = require("blink.cmp.config").completion.menu.max_height

        if #list.items == 0 or list.context == nil then
          return
        end

        -- haven't selected anything yet, select the last item, if cycling enabled
        if list.selected_item_idx == nil then
          if not list.config.cycle.from_top then
            return
          end

          return list.select(#list.items)
        end

        -- start of the list
        if list.selected_item_idx == 1 then
          -- auto_insert is enabled, we go back to no selection
          if list.get_selection_mode(list.context).auto_insert then
            return list.select(nil)
          end

          -- cycling around has been disabled, ignore
          if not list.config.cycle.from_top then
            return
          end

          -- otherwise, we cycle around
          return list.select(#list.items)
        end

        -- typical case, select the previous item
        local dest = math.floor(list.selected_item_idx - max_height / 2)
        list.select(dest < 1 and 1 or dest)
      end,
      mode = { "i", "s" },
    },
  },
}
