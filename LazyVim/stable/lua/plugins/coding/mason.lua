return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- shell
      "bash-language-server",
      "shfmt",
      "shellcheck",

      -- lua
      "lua-language-server",
      "selene",
      "stylua",

      -- web
      -- "biome",
      "css-lsp",
      "css-variables-language-server",
      "cssmodules-language-server",
      "emmet-language-server",
      -- "eslint-lsp",
      "html-lsp",
      "js-debug-adapter",
      "quick-lint-js",
      "stylelint",
      "tailwindcss-language-server",
      -- "typescript-language-server",

      -- c/cpp
      "clang-format",
      "clangd",

      -- java
      "java-debug-adapter",
      "vscode-java-decompiler",

      -- c#
      -- "csharp-language-server",
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
  },
}
