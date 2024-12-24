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
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = clear_keymaps,
    opts = {
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
      window = {
        mappings = {
          ["C"] = "none",
          ["L"] = {
            function(state)
              local fs = require("neo-tree.sources.filesystem")
              local commands = require("neo-tree.sources.common.commands")
              local node = state.tree:get_node()
              commands.expand_all_nodes(state, node, fs.prefetcher)
            end,
            desc = "Expand nodes recursively",
          },
          ["Z"] = "expand_all_nodes",
          ["H"] = "close_all_subnodes",
          ["E"] = "toggle_auto_expand_width",
        },
      },
      filesystem = {
        window = {
          mappings = {
            [","] = "toggle_hidden",
          },
        },
      },
      git_status = {
        window = {
          mappings = {
            ["A"] = "none",
            ["gu"] = "none",
            ["ga"] = "none",
            ["gr"] = "none",
            ["gc"] = "none",
            ["gp"] = "none",
            ["gg"] = "none",
            ["a"] = "git_add_all",
            ["<space>"] = "git_add_file",
            ["<C-space>"] = "git_unstage_file",
            ["d"] = "git_revert_file",
            ["c"] = "git_commit",
            ["P"] = "git_push",
            ["C"] = "git_commit_and_push",
          },
        },
      },
    },
  },
  {
    "dunix241/neo-tree.nvim",
    branch = "feat-add-rename-basename",
    opts = {
      window = {
        mappings = {
          -- ["b"] = "rename_basename",
          ["O"] = {
            function(state)
              -- require("lazy.util").open(state.tree:get_node().path, { system = true })
              require("utils.io").shell_open(state.tree:get_node().path)
            end,
            desc = "Open with System Application",
          },
          ["E"] = {
            function(state)
              local sys_info = require("utils.io").get_system_info()
              local path = state.tree:get_node().path
              local stat = vim.loop.fs_stat(path)
              local uri = (stat and stat.type == "directory") and path or vim.fn.fnamemodify(path, ":p:h")

              local cmd
              if sys_info.is_windows or sys_info.is_wsl then
                if sys_info.is_wsl then
                  local handle = io.popen("wslpath -w " .. vim.fn.shellescape(uri))
                  uri = handle:read("*a"):gsub("\n", "")
                  handle:close()
                end
                cmd = { "explorer.exe", uri }
              elseif vim.fn.has("macunix") == 1 then
                cmd = { "open", uri }
              else
                if vim.fn.executable("nautilus") == 1 then
                  cmd = { "nautilus", uri }
                end
              end

              local ret = vim.fn.jobstart(cmd, { detach = true })
              if ret <= 0 then
                local msg = {
                  "Failed to open uri",
                  ret,
                  vim.inspect(cmd),
                }
                vim.notify(table.concat(msg, "\n"), vim.log.levels.ERROR)
              end
            end,
            desc = "Open with System Explorer",
          },
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    keys = clear_keymaps,
  },
  {
    "williamboman/mason.nvim",
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

      opts = vim.tbl_deep_extend("force", {}, opts, {
        servers = {
          bashls = {
            -- filetypes = { "sh", "zsh" },
          },
          -- grammarly = {},
          powershell_es = {
            filetypes = { "ps1" },
            cmd = {
              "pwsh.exe",
              "-NoLogo",
              "-NoProfile",
              "-Command",
              "&",
              "'C:\\Users\\datvo\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1'",
              "-BundledModulesPath",
              "'C:\\Users\\datvo\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services'",
              "-LogPath",
              "'C:\\Users\\datvo\\AppData\\Local\\Temp\\nvim/powershell_es.log'",
              "-SessionDetailsPath",
              "'C:\\Users\\datvo\\AppData\\Local\\Temp\\nvim/powershell_es.session.json'",
              "-FeatureFlags",
              "@()",
              "-AdditionalModules",
              "@()",
              "-HostName",
              "nvim",
              "-HostProfileId",
              "0",
              "-HostVersion",
              "1.0.0",
              "-Stdio",
              "-LogLevel",
              "Normal",
            },
          },
          ltex = {
            -- additionalRules = {
            --   languageModel = "~/ngrams/",
            -- },
          },
          -- textlsp = {},
        },
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
    -- enabled = false,
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
    keys = clear_keymaps,
  },
  {
    "hrsh7th/nvim-cmp",
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
      opts = vim.tbl_deep_extend("force", {}, opts, {
        lsp = {
          signature = {
            enabled = false,
            auto_open = { enabled = false },
          },
          hover = {
            eanbled = true,
            silent = true,
          },
        },
      })
      return opts
    end,
    keys = clear_keymaps,
  },
  -- {
  --   "nvim-pack/nvim-spectre",
  --   keys = clear_keymaps,
  -- },
  {
    "folke/todo-comments.nvim",
    opts = {},
    keys = clear_keymaps,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = clear_keymaps,
    opts = {
      defaults = {
        mappings = {
          n = {
            ["s"] = "select_vertical",
            ["S"] = "select_horizontal",
          },
        },
        file_ignore_patterns = {
          "node_modules",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
    opts = function()
      local tsc = require("treesitter-context")

      return {
        max_lines = 3,
      }
    end,
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
    keys = clear_keymaps,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    enabled = false,
  },
}
