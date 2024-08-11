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
          ["e"] = {
            function(state, callback)
              local loop = vim.loop
              local utils = require("neo-tree.utils")
              local inputs = require("neo-tree.ui.inputs")
              local events = require("neo-tree.events")
              local log = require("neo-tree.log")

              local tree = state.tree
              local node = tree:get_node()
              if node.type == "message" then
                return
              end

              local function rename_buffer(old_path, new_path)
                local force_save = function()
                  vim.cmd("silent! write!")
                end

                for _, buf in pairs(vim.api.nvim_list_bufs()) do
                  if vim.api.nvim_buf_is_loaded(buf) then
                    local buf_name = vim.api.nvim_buf_get_name(buf)
                    local new_buf_name = nil
                    if old_path == buf_name then
                      new_buf_name = new_path
                    elseif utils.is_subpath(old_path, buf_name) then
                      new_buf_name = new_path .. buf_name:sub(#old_path + 1)
                    end
                    if utils.truthy(new_buf_name) then
                      local new_buf = vim.fn.bufadd(new_buf_name)
                      vim.fn.bufload(new_buf)
                      vim.api.nvim_buf_set_option(new_buf, "buflisted", true)
                      replace_buffer_in_windows(buf, new_buf)

                      if vim.api.nvim_buf_get_option(buf, "buftype") == "" then
                        local modified = vim.api.nvim_buf_get_option(buf, "modified")
                        if modified then
                          local old_buffer_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
                          vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, old_buffer_lines)

                          local msg = buf_name .. " has been modified. Save under new name? (y/n) "
                          inputs.confirm(msg, function(confirmed)
                            if confirmed then
                              vim.api.nvim_buf_call(new_buf, force_save)
                              log.trace("Force saving renamed buffer with changes")
                            else
                              vim.cmd("echohl WarningMsg")
                              vim.cmd(
                                [[echo "Skipping force save. You'll need to save it with `:w!` when you are ready to force writing with the new name."]]
                              )
                              vim.cmd("echohl NONE")
                            end
                          end)
                        end
                      end
                      vim.api.nvim_buf_delete(buf, { force = true })
                    end
                  end
                end
              end

              local rename_node = function(path, callback)
                local parent_path, _ = utils.split_path(path)
                local name = vim.fn.fnamemodify(path, ":t:r")
                local msg = string.format('Enter new name for "%s":', name)
                local extension = vim.fn.fnamemodify(path, ":e")

                inputs.input(msg, name, function(new_name)
                  -- If cancelled
                  if not new_name or new_name == "" then
                    log.info("Operation canceled")
                    return
                  end

                  local destination = parent_path
                    .. utils.path_separator
                    .. new_name
                    .. (extension:len() == 0 and "" or "." .. extension)

                  -- If aleady exists
                  if loop.fs_stat(destination) then
                    log.warn(destination, " already exists")
                    return
                  end

                  local complete = vim.schedule_wrap(function()
                    rename_buffer(path, destination)
                    events.fire_event(events.FILE_RENAMED, {
                      source = path,
                      destination = destination,
                    })
                    if callback then
                      callback(path, destination)
                    end
                    log.info("Renamed " .. new_name .. " successfully")
                  end)

                  local function fs_rename()
                    loop.fs_rename(path, destination, function(err)
                      if err then
                        log.warn("Could not rename the files")
                        return
                      else
                        complete()
                      end
                    end)
                  end

                  local event_result = events.fire_event(events.BEFORE_FILE_RENAME, {
                    source = path,
                    destination = destination,
                    callback = fs_rename,
                  }) or {}
                  if event_result.handled then
                    return
                  end
                  fs_rename()
                end)
              end

              rename_node(node.path, callback)
            end,
            desc = "Rename basename",
          },
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
    "nvim-treesitter/nvim-treesitter-context",
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
    opts = {},
    keys = clear_keymaps,
  },
}
