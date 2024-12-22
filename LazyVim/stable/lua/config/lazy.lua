vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/dunix241/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=feat/main", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.lazyvim_keymaps = require("config.keymap_overrides")

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "dunix241/LazyVim",
      branch = "customizable-keymaps",
      import = "lazyvim.plugins",
    },
    -- import/override with your plugins
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.test.core" },

    { import = "lazyvim.plugins.extras.formatting.prettier" },
    -- { import = "lazyvim.plugins.extras.formatting.biome" },
    -- { import = "lazyvim.plugins.extras.formatting.black" },
    -- { import = "lazyvim.plugins.extras.linting.eslint" },
    -- { import = "lazyvim.plugins.extras.lsp.none-ls" },
    { import = "lazyvim.plugins.extras.lsp.neoconf" }, -- manage global and local project settings

    { import = "lazyvim.plugins.extras.ai.codeium" },
    { import = "lazyvim.plugins.extras.ai.copilot" },
    { import = "lazyvim.plugins.extras.ai.copilot-chat" },
    { import = "lazyvim.plugins.extras.ai.tabnine" },
    { import = "lazyvim.plugins.extras.ai.supermaven" },
    { import = "plugins.extras.ai.codecompanion" },
    -- { import = "plugins.extras.ai.avante" },

    { import = "lazyvim.plugins.extras.coding.luasnip" },

    { import = "lazyvim.plugins.extras.lang.angular" },
    -- { import = "lazyvim.plugins.extras.lang.astro" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.git" },
    -- { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.java" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.omnisharp" },
    -- { import = "lazyvim.plugins.extras.lang.php" },
    -- { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.sql" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    -- { import = "lazyvim.plugins.extras.lang.tex" },
    -- { import = "lazyvim.plugins.extras.lang.toml" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.vue" },
    { import = "lazyvim.plugins.extras.lang.yaml" },

    { import = "plugins.extras.lang.cs-nuget-cmp" },
    { import = "plugins.extras.lang.vi-mongo" },
    -- { import = "plugins.extras.lang.js-test" },

    { import = "lazyvim.plugins.extras.editor.telescope" },
    { import = "lazyvim.plugins.extras.editor.fzf" },
    -- { import = "lazyvim.plugins.extras.editor.illuminate" },
    -- { import = "lazyvim.plugins.extras.editor.inc-rename" },
    -- { import = "lazyvim.plugins.extras.editor.refactoring" },
    { import = "lazyvim.plugins.extras.editor.harpoon2" },
    { import = "lazyvim.plugins.extras.editor.mini-files" },

    -- { import = "lazyvim.plugins.extras.ui.edgy" },
    { import = "plugins.extras.ui.nvchad" },
    -- { import = "plugins.extras.ui.nvchad-menu" },
    { import = "plugins.extras.ui.drop" },
    -- { import = "plugins.extras.ui.cyclist" },
    -- { import = "plugins.extras.ui.virtcolumn" },
    -- { import = "plugins.extras.ui.deadcolumn" },
    -- { import = "lazyvim.plugins.extras.ui.smear-cursor" },

    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    { import = "lazyvim.plugins.extras.coding.yanky" },
    -- { import = "lazyvim.plugins.extras.coding.blink" },

    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.util.rest" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    -- { import = "lazyvim.plugins.extras.util.startuptime" },
    -- { import = "lazyvim.plugins.extras.util.dot" },

    { import = "plugins.extras.utils.pendulum" },
    { import = "plugins.extras.utils.vim-wakatime" },
    { import = "plugins.extras.utils.global-note" },
    { import = "plugins.extras.utils.obsidian" },
    -- { import = "plugins.extras.utils.hardtime" },
    -- { import = "plugins.extras.utils.precognition" },

    { import = "plugins.extras.utils.image-clip" },
    -- { import = "plugins.extras.utils.image-viewer" },

    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  dev = {
    path = "~/Projects/nvim",
  },
  -- install = { colorscheme = { "tokyonight", "habamax" } },
  install = { colorscheme = { "nvchad" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}, {
  rocks = {
    hererocks = true, -- recommended if you do not have global installation of Lua 5.1.
  },
})
