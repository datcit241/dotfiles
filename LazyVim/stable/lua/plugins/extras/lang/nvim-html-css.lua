return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "Jezda1337/nvim-html-css", -- add it as dependencies of `nvim-cmp` or standalone plugin
  },
  opts = {
    sources = {
      {
        name = "html-css",
        option = {
          enable_on = { "html", "javascriptreact", "typescriptreact" }, -- html is enabled by default
          notify = false,
          documentation = {
            auto_show = true, -- show documentation on select
          },
          -- add any external scss like one below
          style_sheets = {
            "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
            "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
          },
        },
      },
    },
  },
}
