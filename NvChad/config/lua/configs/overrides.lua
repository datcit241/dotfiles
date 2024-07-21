local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "css",
    "diff",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "printf",
    "python",
    "query",
    "regex",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  },
  auto_install = true,
  sync_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua
    "lua-language-server",
    "selene",
    "stylua",

    -- web
    "biome",
    "css-lsp",
    "css-variables-language-server",
    "cssmodules-language-server",
    -- "deno",
    "emmet-language-server",
    "eslint-lsp",
    "glint",
    "html-lsp",
    "js-debug-adapter",
    "quick-lint-js",
    "stylelint",
    "tailwindcss-language-server",
    "typescript-language-server",

    -- c/cpp
    "clang-format",
    "clangd",

    -- c#
    "csharp-language-server",
    "csharpier",
    "netcoredbg",
    "omnisharp",

    -- formatter
    "prettierd",

    -- grammar & spell checker
    -- "harper-ls",
    "typos-lsp",

    -- json & yaml
    "spectral-language-server",

    -- sql
    "sqlfmt",
    "sqlls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },
  update_focused_file = {
    update_root = false,
  },

  renderer = {
    root_folder_label = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

local cmp = require "cmp"
M.cmp = {
  mapping = {
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
    ["<Tab>"] = cmp.mapping(function(fallback)
      fallback()
    end),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      fallback()
    end),
  },
}

M.telescope = {
  pickers = {
    oldfiles = {
      cwd_only = true,
    },
  },
}

return M
