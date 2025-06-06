local colorscheme = vim.g.custom_colorscheme or vim.g.default_colorscheme or "tokyonight"

return {
  vim.g.use_nvchad and require("plugins.colorschemes.init") or {},
  {
    "dunix241/LazyVim",
    opts = {
      colorscheme = vim.g.use_nvchad and function() end or colorscheme,
    },
  },
}
