local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

	{
		"folke/which-key.nvim",
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "whichkey")
			require("which-key").setup(opts)
			local present, wk = pcall(require, "which-key")

			if not present then
				return
			end
			wk.register({
				-- add group
				["<leader>"] = {
					f = { name = "+file" },
				},
			})
		end,
		setup = function()
			require("core.utils").load_mappings("whichkey")
		end,
    lazy = false
	},

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require("custom.configs.dressing").setup()
    end,
    dependencies = { "MunifTanjim/nui.nvim" },
    lazy = false,
  },

  {
    "pocco81/auto-save.nvim",
    lazy = false
  },

  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false
  },

  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
    lazy = false,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,

    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
          -- load default luasnip config
          require("plugins.configs.others").luasnip(opts)

          local luasnip = require "luasnip"
          luasnip.filetype_extend("javascriptreact", { "html" })
          luasnip.filetype_extend("typescriptreact", { "html" })
          require("luasnip/loaders/from_vscode").lazy_load()
        end,
      },

      -- ai based completion
      {
        "jcdickinson/codeium.nvim",
        branch = 'main',
        config = function()
          require("codeium").setup {}
        end,
        lazy = false
      },
    },
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('custom.configs.nvim-ts-autotag')
    end,
    lazy = false,
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    lazy = false,
    opts = {} -- this is equalent to setup({}) function

  },

  {
    'p00f/nvim-ts-rainbow',
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
        }
      }
    end,
    dependencies = { 'nvim-treesitter' },
    lazy = false,
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },

  -- dim inactive windows
  {
    "andreadev-it/shade.nvim",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  -- pretty diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },

  -- syntax support fgor yuck lang
  {
    "elkowar/yuck.vim",
    ft = "yuck",
  },

  -- distraction free mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zenmode"
    end,
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
