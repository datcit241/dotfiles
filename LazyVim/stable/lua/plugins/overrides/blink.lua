return {
  "saghen/blink.cmp",
  optional = true, -- or check LazyVim.has_extra("coding.blink")
  opts = {
    completion = {
      menu = {
        max_height = 20,
      },
    },
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
  },
}
