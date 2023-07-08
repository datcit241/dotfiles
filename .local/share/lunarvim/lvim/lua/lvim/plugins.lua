-- local require = require("lvim.utils.require").require
local core_plugins = {
  { 'lewis6991/impatient.nvim' },
  { "folke/lazy.nvim",         tag = "stable" },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-tree/nvim-web-devicons",
    enabled = lvim.use_icons,
  },

  -- LSP Base
  {
    "williamboman/mason.nvim",
    config = function()
      require("lvim.core.mason").setup()
    end,
  },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "mason-lspconfig.nvim", "nlsp-settings.nvim" },
  },
  { "tamago324/nlsp-settings.nvim",      lazy = true },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  {
    'jose-elias-alvarez/nvim-lsp-ts-utils'
  },

  -- LSP Cmp
  {
    "hrsh7th/nvim-cmp",
    config = function()
      if lvim.builtin.cmp then
        require("lvim.core.cmp").setup()
      end
    end,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "cmp-nvim-lsp",
      "cmp_luasnip",
      "cmp-buffer",
      "cmp-path",
      "cmp-cmdline",
    },
  },
  {
    "hrsh7th/cmp-nvim-lua",
    config = function()
      require("lvim.core.cmp").setup({
        sources = {
          { name = 'nvim_lua' }
        }
      })
    end,
  },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-buffer",   lazy = true },
  { "hrsh7th/cmp-path",     lazy = true },
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
    enabled = lvim.builtin.cmp and lvim.builtin.cmp.cmdline.enable or false,
  },
  {
    "hrsh7th/cmp-calc",
    config = function()
      require('lvim.core.cmp').setup({
        sources = {
          { name = 'calc' }
        }
      })
    end
  },
  {
    "tzachar/cmp-tabnine",
    build = './install.sh',
    dependencies = 'hrsh7th/nvim-cmp'
  },
  {
    "David-Kunz/cmp-npm",
    config = function()
      require('cmp-npm').setup({})
    end,
    dependencies = 'nvim-lua/plenary.nvim',
  },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
  { "Exafunction/codeium.vim" },

  -- LSP Addons
  -- Popup to code action, nvim-tree
  {
    "stevearc/dressing.nvim",
    config = function()
      require('lvim.core.dressing').setup()
    end,
    dependencies = { "MunifTanjim/nui.nvim" },
  },
  -- Add vscode pictogram
  {
    "onsails/lspkind-nvim"
  },
  {
    "folke/lsp-trouble.nvim",
    config = function()
      require('lvim.core.trouble').setup()
    end
  },
  { "nvim-lua/popup.nvim" },
  {
    "jose-elias-alvarez/typescript.nvim"
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require('lsp-inlayhints').setup()
    end
  },
  {
    "folke/neodev.nvim",
    lazy = true,
  },
  { "jose-elias-alvarez/null-ls.nvim", lazy = true },
  -- SchemaStore
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },

  -- Components
  -- Telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true, enabled = lvim.builtin.telescope.active },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = function()
      require("lvim.core.telescope").setup()
    end,
    dependencies = { "telescope-fzf-native.nvim" },
    lazy = true,
    cmd = "Telescope",
    enabled = lvim.builtin.telescope.active,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("lvim.core.project").setup()
    end,
    enabled = lvim.builtin.project.active,
  },
  { "cljoly/telescope-repo.nvim", },
  -- Better quickfix
  { "kevinhwang91/nvim-bqf",                    ft = "qf" },
  -- Find and replace
  { "nvim-pack/nvim-spectre" },
  {
    "kyazdani42/nvim-tree.lua",
    -- event = "BufWinOpen",
    -- cmd = "NvimTreeToggle",
    config = function()
      require("lvim.core.nvimtree").setup()
    end,
    enabled = lvim.builtin.nvimtree.active,
  },
  -- Lir explorer
  {
    "tamago324/lir.nvim",
    config = function()
      require("lvim.core.lir").setup()
    end,
    enabled = lvim.builtin.lir.active,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("lvim.core.which-key").setup()
    end,
    event = "VeryLazy",
    enabled = lvim.builtin.which_key.active,
  },
  -- Alpha dashboard
  {
    "goolord/alpha-nvim",
    config = function()
      require("lvim.core.alpha").setup()
    end,
    enabled = lvim.builtin.alpha.active,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    branch = "main",
    config = function()
      require("lvim.core.terminal").setup()
    end,
    enabled = lvim.builtin.terminal.active,
  },
  -- Status Line and Bufferline
  {
    -- "hoob3rt/lualine.nvim",
    "nvim-lualine/lualine.nvim",
    -- "Lunarvim/lualine.nvim",
    config = function()
      require("lvim.core.lualine").setup()
    end,
    enabled = lvim.builtin.lualine.active,
  },
  -- {
  --   'glepnir/galaxyline.nvim',
  --   branch = 'main',
  --   -- your statusline
  --   config = function()
  --     require('lvim.core.galaxyline')
  --   end,
  --   -- some optional icons
  --   dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  -- },
  -- winbar
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("lvim.core.breadcrumbs").setup()
    end,
    enabled = lvim.builtin.breadcrumbs.active,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("lvim.core.bufferline").setup()
    end,
    branch = "main",
    enabled = lvim.builtin.bufferline.active,
  },
  -- {
  --   'romgrk/barbar.nvim',
  --   config = function()
  --     require('lvim.core.barbar').setup()
  --   end,
  --   dependencies = { 'nvim-tree/nvim-web-devicons' }
  -- },

  -- Snippets & Language
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate",
    config = function()
      local utils = require "lvim.utils"
      local path = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "nvim-treesitter")
      vim.opt.rtp:prepend(path) -- treesitter needs to be before nvim's runtime in rtp
      require("lvim.core.treesitter").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { 'nvim-treesitter' }
  },
  -- Expand selection
  {
    "RRethy/nvim-treesitter-textsubjects",
    config = function()
      require('nvim-treesitter.configs').setup({
        textsubjects = {
          enable = true,
          keymaps = {
            ['.'] = 'textsubjects-smart'
          }
        }
      })
    end
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
  },
  -- Highlight other uses of word under cursor
  {
    "RRethy/vim-illuminate",
    config = function()
      require("lvim.core.illuminate").setup()
    end,
    event = "VeryLazy",
    enabled = lvim.builtin.illuminate.active,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("lvim.core.autopairs").setup()
    end,
    enabled = lvim.builtin.autopairs.active,
  },
  {
    'p00f/nvim-ts-rainbow',
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          -- ...
        },
        -- ...
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        }
      }
    end,
    dependencies = { 'nvim-treesitter' }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("lvim.core.indentlines").setup()
    end,
    enabled = lvim.builtin.indentlines.active,
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local utils = require "lvim.utils"
      local paths = {}
      if lvim.builtin.luasnip.sources.friendly_snippets then
        paths[#paths + 1] = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "friendly-snippets")
      end
      local user_snippets = utils.join_paths(get_config_dir(), "snippets")
      if utils.is_directory(user_snippets) then
        paths[#paths + 1] = user_snippets
      end
      require("luasnip.loaders.from_lua").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = paths,
      }
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    event = "InsertEnter",
    dependencies = {
      "friendly-snippets",
    },
  },
  {
    "rafamadriz/friendly-snippets",
    lazy = true,
    cond = lvim.builtin.luasnip.sources.friendly_snippets
  },

  -- Syntax
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("lvim.core.comment").setup()
    end,
    enabled = lvim.builtin.comment.active,
  },
  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    'chomosuke/term-edit.nvim',
    -- lazy = false, -- or ft = 'toggleterm' if you use toggleterm.nvim
    ft = 'toggleterm',
    version = '1.*',
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    require('refactoring').setup({
      prompt_func_return_type = {
        go = false,
        java = true,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      prompt_func_param_type = {
        go = false,
        java = true,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      printf_statements = {},
      print_var_statements = {},
    })
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup()
      require('lvim.core.nvim-ufo').setup()
    end
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("lvim.core.gitsigns").setup()
    end,
    depedencies = { 'nvim-lua/plenary.nvim' },
    event = "BufRead",
    enabled = lvim.builtin.gitsigns.active,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require('lvim.core.git.diffview')
    end
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require('lvim.core.git.conflict')
    end
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require('lvim.core.git.worktree')
    end
  },
  {
    "kdheepak/lazygit.nvim"
  },

  -- Debugger DAP
  {
    "mfussenegger/nvim-dap",
    -- event = "BufWinEnter",
    config = function()
      require("lvim.core.dap").setup()
    end,
    enabled = lvim.builtin.dap.active,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("lvim.core.dap").setup_ui()
    end,
    enabled = lvim.builtin.dap.active,
  },
  { "theHamsta/nvim-dap-virtual-text" },

  -- { "mfussenegger/nvim-jdtls",
  --   config = function()
  --     require('jdtls').start_or_attach({
  --       cmd = { '/path/to/jdt-language-server/bin/jdtls' },
  --       root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  --     })
  --   end,
  -- },

  -- Themes
  {
    "folke/tokyonight.nvim",
    config = function()
      require("lvim.core.tokyonight").setup()
    end,
  },
  {
    "lunarvim/lunar.nvim",
  },
  {
    "navarasu/onedark.nvim",
  },
  {
    "marko-cerovac/material.nvim"
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine'
  },
  {
    "rebelot/kanagawa.nvim",
    setup = function()
    -- Default options:
    require('kanagawa').setup({
      compile = false,  -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,    -- do not set background color
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {
        -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "wave", -- Load "wave" theme when 'background' option is not set
      background = {
        -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus"
      },
    })
    end
  },
  {
    "AmeerTaweel/todo.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "lunarvim/onedarker.nvim",
    branch = "freeze",
    -- config = function()
    --   pcall(function()
    --     if lvim and lvim.colorscheme == "onedarker" then
    --       require("onedarker").setup()
    --       lvim.builtin.lualine.options.theme = "onedarker"
    --     end
    --   end)
    -- end,
    -- enabled = lvim.colorscheme == "onedarker",
  },
  { "Mofiqul/dracula.nvim" },
  {
    "Mofiqul/vscode.nvim",
    -- config = function()
    --   require("lvim.core.vscode").setup()
    -- end
  },
  { "svrana/neosolarized.nvim" },
  {
    "catppuccin/nvim",
    setup = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = {
          -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false,   -- Force no bold
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = false,
          mini = false,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
    end
  },

  -- Looks and feels
  {
    'xiyaowong/nvim-transparent',
    config = function()
      require("lvim.core.nvim-transparent").setup()
    end
  },
  -- { 'gen740/SmoothCursor.nvim',
  --   config = function()
  --     require('smoothcursor').setup()
  --   end
  -- },

  {
    "lunarvim/bigfile.nvim",
    config = function()
      pcall(function()
        require("bigfile").config(lvim.builtin.bigfile.config)
      end)
    end,
    enabled = lvim.builtin.bigfile.active,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  { "Tastyep/structlog.nvim" },
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require('chatgpt').setup({
        keymaps = {
          submit = "<A-Enter>"
        }
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  -- {
  --   'nvim-lua/completion-nvim',
  --   config = function()
  --     require("lspconfig").jdtls.setup({
  --       on_attach = require("completion").on_attach
  --     })
  --   end,
  -- },

  -- firenvim to turn browser's input fields to using nvim
  {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end,
    -- -- Lazy load firenvim
    -- -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    -- cond = not not vim.g.started_by_firenvim,
    -- build = function()
    --   require("lazy").load({ plugins = "firenvim", wait = true })
    --   vim.fn["firenvim#install"](0)
    -- end
  },
  {
    'dstein64/vim-startuptime',
  },
}

local default_snapshot_path = join_paths(get_lvim_base_dir(), "snapshots", "default.json")
local content = vim.fn.readfile(default_snapshot_path)
local default_sha1 = assert(vim.fn.json_decode(content))

-- taken form <https://github.com/folke/lazy.nvim/blob/c7122d64cdf16766433588486adcee67571de6d0/lua/lazy/core/plugin.lua#L27>
local get_short_name = function(long_name)
  local name = long_name:sub(-4) == ".git" and long_name:sub(1, -5) or long_name
  local slash = name:reverse():find("/", 1, true) --[[@as number?]]
  return slash and name:sub(#name - slash + 2) or long_name:gsub("%W+", "_")
end
local get_default_sha1 = function(spec)
  local short_name = get_short_name(spec[1])
  return default_sha1[short_name] and default_sha1[short_name].commit
end

if not vim.env.LVIM_DEV_MODE then
  --  Manually lock the commit hashes of core plugins
  for _, spec in ipairs(core_plugins) do
    spec["commit"] = get_default_sha1(spec)
  end
end

return core_plugins
