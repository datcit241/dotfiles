local function clear_keymaps()
  return {}
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function() end,
      defaults = {
        keymaps = false, -- lazyvim.config.keymaps
      },
    },
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   enabled = false,
  -- },
  {
    "folke/which-key.nvim",
    keys = clear_keymaps,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
    keys = clear_keymaps,
  },
  {
    "echasnovski/mini.ai",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "<leader>cA", false }
      keys[#keys + 1] = { "<leader>cc", false }
      keys[#keys + 1] = { "<leader>cC", false }
      keys[#keys + 1] = { "<leader>cr", false }
      keys[#keys + 1] = { "<leader>cR", false }
      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = { "<leader>cF", false }
      keys[#keys + 1] = { "<leader>cs", false }
      keys[#keys + 1] = { "<leader>cS", false }

      table.insert(opts, {
        document_highlight = {
          enabled = false,
        },
      })
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {},
    keys = clear_keymaps,
  },
  {
    "folke/trouble.nvim",
    opts = {},
    keys = clear_keymaps,
  },
  {
    "folke/flash.nvim",
    enabled = false,
    opts = {},
    keys = clear_keymaps,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = {
        ["<Down>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<Up>"] = cmp.mapping(function(fallback)
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

      return opts
    end,
    dependencies = {
      -- ai based completion
      {
        "Exafunction/codeium.nvim",
        opts = {},
        lazy = false,
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {},
    keys = clear_keymaps,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.lsp.signature = {
        enabled = false,
        auto_open = { enabled = false },
      }
      return opts
    end,
    keys = clear_keymaps,
  },
  {
    "nvim-pack/nvim-spectre",
    keys = clear_keymaps,
  },
  {
    "folke/todo-comments.nvim",
    opts = {},
    keys = clear_keymaps,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = clear_keymaps,
  },
  {
    "folke/persistence.nvim",
    keys = clear_keymaps,
  },
  {
    "mfussenegger/nvim-dap",
    opts = {},
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
      },
    },
    keys = clear_keymaps,
  },
  {
    "nvim-neotest/neotest",
    keys = clear_keymaps,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    opts = {},
    keys = clear_keymaps,
  },
}
