-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Check the following for `lspconfig` supported servers:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  -- lua
  "lua_ls",

  -- web
  "biome",
  "cssls",
  "css_variables",
  "cssmodules_ls",
  "emmet_language_server",
  "eslint",
  "glint",
  "html",
  "quick_lint_js",
  "stylelint_lsp",
  "tailwindcss",
  "tsserver",

  -- c/cpp
  "clangd",

  -- c#
  "csharp_ls",
  "omnisharp",

  -- grammar & spell checker
  -- "harper_ls",
  "typos_lsp",

  -- json & yaml
  "spectral",

  -- sql
  "sqlls",
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      },
    },
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}
