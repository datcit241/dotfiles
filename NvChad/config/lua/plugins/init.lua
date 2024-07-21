local overrides = require("configs.overrides")

return {
  require("plugins.configs.conform"),

  -- override plugin configs
  require("plugins.configs.mason"),
  require("plugins.configs.nvim-lspconfig"),
  require("plugins.configs.which-key"),
  require("plugins.configs.telescope"),

  require("plugins.configs.nvim-treesitter"),
  require("plugins.configs.nvim-tree"),
  require("plugins.configs.nvim-cmp"),

  -- Install a plugin
  require("plugins.configs.better-escape"),
  require("plugins.configs.auto-save"),
  require("plugins.configs.neoscroll"),
  require("plugins.configs.nvim-surround"),
  require("plugins.configs.oil"),

  -- Git
  require("plugins.configs.lazygit"),

  -- Lsp
  require("plugins.configs.trouble"), -- pretty diagnostics panel
  require("plugins.configs.lspsaga"),

  -- Extensions
  require("plugins.configs.undotree"),
  require("plugins.configs.vim-tmux-navigator"),
  require("plugins.configs.nvim-treesitter-context"),
  require("plugins.configs.nvim-ts-context-commentstring"),

  -- Syntax & Highlighting
  require("plugins.configs.nvim-ts-autotag"),
  require("plugins.configs.nvim-autopairs"),
  require("plugins.configs.nvim-ts-rainbow"),
  require("plugins.configs.indent-blankline"),
  require("plugins.configs.nvim-colorizer"),

  -- Look & Feel
  require("plugins.configs.nvim-material-icon"),
  require("plugins.configs.dressing"),
  require("plugins.configs.zen-mode"),
  -- require("plugins.configs.shade"), -- dim inactive windows
  require("plugins.configs.cinnamon"),
  require("plugins.configs.nvim-notify"),
  require("plugins.configs.todo-comments"),
  -- require("plugins.configs.codewindow"),
  require("plugins.configs.twilight"),
  require("plugins.configs.noice"),
  -- require("plugins.configs.lazydev"),

  -- Languages & Tools
  require("plugins.configs.markdown-preview"),
  require("plugins.configs.copilot"),
  require("plugins.configs.yuck"), -- syntax support fgor yuck lang
  -- require("plugins.configs.nvim-peekup"),
  require("plugins.configs.vim-dadbod"),

  -- Dap
  require("plugins.configs.nvim-dap"),
  -- require("plugins.configs.nvim-dap-ui"),
  -- require("plugins.configs.dap-cs"),

  -- Test
  require("plugins.configs.neotest"),

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
