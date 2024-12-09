return {
  "hrsh7th/nvim-cmp",
  optional = true, -- or check not LazyVim.has_extra("coding.blink")
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.formatting = {
      format = function(entry, item)
        local icons = LazyVim.config.icons.kinds
        if icons[item.kind] then
          if entry.source.name == "buffer" then
            item.kind = "Buffer"
          elseif entry.source.name == "nuget" then
            item.kind = "NuGet"
          end

          item.kind = (icons[item.kind] or "") .. (item.kind or "")
          -- require("utils.notify").info(item.kind)
        end

        if entry.source.name == "nvim_lsp" then
          item.menu = "{" .. entry.source.source.client.name .. "}"
        end

        local widths = {
          abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
          menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
        }

        for key, width in pairs(widths) do
          if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
            item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
          end
        end

        return item
      end,
      --   format = function(entry, vim_item)
      --     if entry.source.name == "buffer" then
      --       vim_item.menu = "[Buffer]"
      --     elseif entry.source.name == "nvim_lsp" then
      --       vim_item.menu = "{" .. entry.source.source.client.name .. "}"
      --     else
      --       vim_item.menu = "[" .. entry.source.name .. "]"
      --     end
      --
      --     return vim_item
      --   end,
    }
    opts.mapping = {
      ["<c-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<c-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        fallback()
      end),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        fallback()
      end),
    }

    opts.window = {
      completion = {
        -- border = "rounded",
        -- winhighlight = "Normal:CmpNormal",
        winblend = 0,
      },
      documentation = {
        -- winhighlight = "Normal:CmpDocNormal",
        winblend = 0,
      },
    }

    return opts
  end,
}
