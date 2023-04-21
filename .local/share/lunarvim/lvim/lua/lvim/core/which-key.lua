local M = {}
M.config = function()
  lvim.builtin.which_key = {
    ---@usage disable which-key completely [not recommended]
    active = true,
    on_config_done = nil,
    setup = {
      plugins = {
        marks = false,     -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,
          suggestions = 20,
        }, -- use which-key for spelling hints
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false,    -- adds help for operators like d, y, ...
          motions = false,      -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false,      -- default bindings on <c-w>
          nav = false,          -- misc bindings to work with windows
          z = false,            -- bindings for folds, spelling and others prefixed with z
          g = false,            -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = lvim.icons.ui.DoubleChevronRight, -- symbol used in the command line area that shows your active key combo
        separator = lvim.icons.ui.BoldArrowRight,      -- symbol used between a key and it's label
        group = lvim.icons.ui.Plus,                    -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
      },
      window = {
        border = "single",        -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 },                                             -- min and max height of the columns
        width = { min = 20, max = 50 },                                             -- min and max width of the columns
        spacing = 3,                                                                -- spacing between columns
        align = "left",                                                             -- align columns left, center or right
      },
      ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true,                                                             -- show help message on the command line when the popup is visible
      show_keys = true,                                                             -- show the currently pressed key and its label as a message in the command line
      triggers = "auto",                                                            -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by deafult for Telescope
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      },
    },
    opts = {
      mode = "n",     -- NORMAL mode
      prefix = "<leader>",
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,  -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true,  -- use `nowait` when creating keymaps
    },
    vopts = {
      mode = "v",     -- VISUAL mode
      prefix = "<leader>",
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,  -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true,  -- use `nowait` when creating keymaps
    },
    -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
    -- see https://neovim.io/doc/user/map.html#:map-cmd
    vmappings = {
      ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
      y = {
        name = 'Yank',
        y = { '"+y', 'Yank' },
        d = { '"+ygvd', 'Delete' },
        p = { '"+p', 'Patse' }
      },
      r = {
        name = "Refactor",
        e = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
        f = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract Function To File" },
        v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
        i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
      },
    },
    mappings = {
      [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
      ["w"] = { "<cmd>w!<CR>", "Save" },
      ["q"] = { "<cmd>confirm q<CR>", "Quit" },
      ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
      ["c"] = { "<cmd>BufferKill<CR>", "Close Buffer" },
      ["f"] = {
        function()
          require("lvim.core.telescope.custom-finders").find_project_files { previewer = false }
        end,
        "Find File",
      },
      ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
      ["t"] = { "<cmd>Telescope<cr>", "Telescope" },
      ["\\"] = {
        name = "Split",
        v = { "<c-w>v", "Split vertically" },
        s = { "<c-w>s", "Split horizontally" }
      },
      a = { 'ggVG', 'Select all' },
      b = {
        name = "Buffers",
        -- q = { "<cmd>BufferKill<cr>", "Close" },
        j = { "<cmd>BufferLinePick<cr>", "Jump" },
        f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
        b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
        -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
        q = {
          "<cmd>BufferLinePickClose<cr>",
          "Pick which buffer to close",
        },
        h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
        l = {
          "<cmd>BufferLineCloseRight<cr>",
          "Close all to the right",
        },
        D = {
          "<cmd>BufferLineSortByDirectory<cr>",
          "Sort by directory",
        },
        L = {
          "<cmd>BufferLineSortByExtension<cr>",
          "Sort by language",
        },
        p = {
          "<cmd>BufferLinePick<cr>",
          "Pick buffer"
        }
      },
      d = {
        name = "Debug",
        t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
        d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
        p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
        s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
        q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
        U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
      },
      p = {
        name = "Plugins",
        i = { "<cmd>Lazy install<cr>", "Install" },
        s = { "<cmd>Lazy sync<cr>", "Sync" },
        S = { "<cmd>Lazy clear<cr>", "Status" },
        c = { "<cmd>Lazy clean<cr>", "Clean" },
        u = { "<cmd>Lazy update<cr>", "Update" },
        p = { "<cmd>Lazy profile<cr>", "Profile" },
        l = { "<cmd>Lazy log<cr>", "Log" },
        d = { "<cmd>Lazy debug<cr>", "Debug" },
      },
      -- " Available Debug Adapters:
      -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
      -- " Adapter configuration and installation instructions:
      -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
      -- " Debug Adapter protocol:
      -- "   https://microsoft.github.io/debug-adapter-protocol/
      -- " Debugging
      g = {
        name = "Git",
        a = { '<cmd>!git add %:p<CR>', 'add current' },
        A = { '<cmd>!git add .<CR>', 'add all' },
        b = { "<cmd>Telescope git_branches<cr>", "Branches" },
        B = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)", },
        -- d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff", },
        d = { '<cmd>lua require("lvim.core.git.diffview").toggle_file_history()<CR>', "Git Diff" },
        g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
        h = {
          name = "Hunk",
          p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
          r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
          R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
          s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
          u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
          },
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        l = {
          name = "Log",
          A = { "<cmd>lua require('lvim.core.telescope').my_git_commits()<CR>", "commits (Telescope)" },
          a = { "<cmd>LazyGitFilter<CR>", "commits" },
          C = { "<cmd>lua require('lvim.core.telescope').my_git_bcommits()<CR>", "buffer commits (Telescope)" },
          c = { "<cmd>LazyGitFilterCurrentFile<CR>", "buffer commits" },
        },
        f = {
          name = 'Conflict',
          b = { '<cmd>GitConflictChooseBoth<CR>', 'choose both' },
          n = { '<cmd>GitConflictNextConflict<CR>', 'move to next conflict' },
          o = { '<cmd>GitConflictChooseOurs<CR>', 'choose ours' },
          p = { '<cmd>GitConflictPrevConflict<CR>', 'move to prev conflict' },
          t = { '<cmd>GitConflictChooseTheirs<CR>', 'choose theirs' },
        },
        s = { '<cmd>lua require("lvim.core.git.diffview").toggle_status()<CR>', 'Status' },
        w = {
          name = "Worktree",
          w = { '<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<cr>', "worktrees" },
          c = { '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>', "create worktree" },
        }
      },
      l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        f = { require("lvim.lsp.utils").format, "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>Mason<cr>", "Mason Info" },
        j = {
          vim.diagnostic.goto_next,
          "Next Diagnostic",
        },
        k = {
          vim.diagnostic.goto_prev,
          "Prev Diagnostic",
        },
        l = { vim.lsp.codelens.run, "CodeLens Action" },
        q = { vim.diagnostic.setloclist, "Quickfix" },
        r = { vim.lsp.buf.rename, "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
      },
      L = {
        name = "+LunarVim",
        c = {
          "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
          "Edit config.lua",
        },
        d = { "<cmd>LvimDocs<cr>", "View LunarVim's docs" },
        f = {
          "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
          "Find LunarVim files",
        },
        g = {
          "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
          "Grep LunarVim files",
        },
        k = { "<cmd>Telescope keymaps<cr>", "View LunarVim's keymappings" },
        i = {
          "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
          "Toggle LunarVim Info",
        },
        I = {
          "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
          "View LunarVim's changelog",
        },
        l = {
          name = "+logs",
          d = {
            "<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
            "view default log",
          },
          D = {
            "<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
            "Open the default logfile",
          },
          l = {
            "<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>",
            "view lsp log",
          },
          L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
          n = {
            "<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
            "view neovim log",
          },
          N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
        },
        r = { "<cmd>LvimReload<cr>", "Reload LunarVim's configuration" },
        u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
      },
      r = {
        name = "Refactor",
        b = { "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block" },
        f = { "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract Block To File" },
        i = { "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
      },
      s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        g = { "<cmd>Telescope registers<cr>", "Registers" },
        -- R = { "<cmd>Telescope registers<cr>", "Registers" },
        R = { "<cmd>Telescope repo list<cr>", "List repo" },
        s = { "<cmd>lua require('spectre').open()<cr>", "Open Spectre" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        -- p = {
        --   "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
        --   "Colorscheme with Preview",
        -- },
        p = { "<cmd>Telescope projects<cr>", "Projects" },
      },
      T = {
        name = "Treesitter",
        i = { ":TSConfigInfo<cr>", "Info" },
      },
      y = {
        name = 'Yank',
        a = { '<cmd>%y+<Cr>', 'Yank all' },
        y = { '"+yy', 'Yank' },
        d = { '"+yydd', 'Delete' },
        p = { '"+p', 'Patse' }
      },
      z = {
        name = "Folds",
        t = { "za", "Toggle" },
        T = { "zA", "Toggle recursively" },
        o = { "zr", "Open" },
        O = { "zR", "Open all" },
        c = { "zm", "Close" },
        C = { "zM", "Close all" },
        -- O = { "<cmd>lua require('ufo').openAllFolds()<cr>", "Open all" },
        -- C = { "<cmd>lua require('ufo').closeAllFolds<cr><cr>", "Close all" },
      }
    },
  }
end
M.setup = function()
  local which_key = require "which-key"
  which_key.setup(lvim.builtin.which_key.setup)


  local opts = lvim.builtin.which_key.opts
  local vopts = lvim.builtin.which_key.vopts

  local mappings = lvim.builtin.which_key.mappings
  local vmappings = lvim.builtin.which_key.vmappings

  which_key.register(mappings, opts)
  which_key.register(vmappings, vopts)

  if lvim.builtin.which_key.on_config_done then
    lvim.builtin.which_key.on_config_done(which_key)
  end
end

return M
