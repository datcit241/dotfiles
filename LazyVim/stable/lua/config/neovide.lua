local g = vim.g
local o = vim.o
local map = vim.keymap.set

o.guifont = "CaskaydiaCove Nerd Font:h10"
if g.neovide then
  o.guifont = "CaskaydiaCove Nerd Font:h12"

  o.guicursor =
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait1000-blinkoff400-blinkon400-Cursor/lCursor,sm:block-blinkwait1000-blinkoff400-blinkon400"
  g.neovide_cursor_smooth_blink = true

  g.neovide_cursor_vfx_mode = "railgun" -- "railgun" | "torpedo" | "pixiedust"

  map("n", "<F11>", function()
    g.neovide_fullscreen = not g.neovide_fullscreen
  end, {})

  map({ "n", "v", "s", "x", "o", "i", "l", "c", "t" }, "<C-S-v>", function()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
  end, { noremap = true, silent = true })

  -- to disable cursor animations
  -- g.neovide_cursor_animation_length = 0
  -- g.neovide_cursor_trail_length = 0
end
