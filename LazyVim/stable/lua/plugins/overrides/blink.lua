return {
  "saghen/blink.cmp",
  optional = true, -- or check LazyVim.has_extra("coding.blink")
  opts = {
    nerd_font_variant = "normal",
    windows = {
      autocomplete = {
        max_height = 15,
      },
    },
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
  },
}
