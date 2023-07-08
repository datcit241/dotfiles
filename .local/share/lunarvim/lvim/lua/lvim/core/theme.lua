local Log = require "lvim.core.log"
local M = {}

M.config = function()
  lvim.builtin.theme = {
    name = "tokyonight",
    lunar = {
      options = { -- currently unused
      },
    },
    tokyonight = {
      options = {
        on_highlights = function(hl, c)
          hl.IndentBlanklineContextChar = {
            fg = c.dark5,
          }
          hl.TSConstructor = {
            fg = c.blue1,
          }
          hl.TSTagDelimiter = {
            fg = c.dark5,
          }
        end,
        style = "moon",                        -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
        transparent = lvim.transparent_window, -- Enable this to disable setting the background color
        terminal_colors = true,                -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark",   -- style for floating windows
        },
        -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        sidebars = {
          "qf",
          "vista_kind",
          "terminal",
          "packer",
          "spectre_panel",
          "NeogitStatus",
          "help",
        },
        day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false,             -- dims inactive windows
        lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
        use_background = true,            -- can be light/dark/auto. When auto, background will be set to vim.o.background
      },
    },
    onedark = {
      options = {
        style = "light",                       -- dark, darker, cool, deep, warm, warmer, light
        transparent = lvim.transparent_window, -- Enable this to disable setting the background color
      }
    },
    material = {
      options = {
        style = "lighter" -- darker, ligher, oceanic, palenight, deep ocean
      }
    },
    vscode = {
      options = {
        style = "light" -- or dark
      }
    }
  }
end

function set_highlights(transparent)
  vim.cmd("hi Comment guifg=#a1a1a1")
  vim.cmd("hi @comment guifg=#a1a1a1")

  vim.cmd("hi LineNr guifg=#aaaaaa")
  vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Special" })

  vim.cmd("hi Buf guifg=#aaaaaa")
  vim.api.nvim_set_hl(0, "BufferLineBuffer", { link = "Buf" })
  vim.api.nvim_set_hl(0, "BufferLineInfo", { link = "Buf" })
  vim.api.nvim_set_hl(0, "BufferLineWarning", { link = "Buf" })
  vim.api.nvim_set_hl(0, "BufferLineTab", { link = "Buf" })
  vim.api.nvim_set_hl(0, "BufferLineHint", { link = "Buf" })

  if transparent then
    vim.cmd("hi NormalFloat guibg=NONE")
    vim.cmd("hi CodeActionNormal guibg=NONE")
  end

  -- Telescope and NvimTree to sync with Nvim
  vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "Normal" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Special" })

  vim.api.nvim_set_hl(0, "NvimTreeNormal", { link = "Normal" })
  vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { link = "Normal" })
  vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { link = "Function" })

  vim.api.nvim_set_hl(0, "Spectre", { link = "Normal" })

  vim.api.nvim_set_hl(0, "GitDiffNormal", { link = "Normal" })
  vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { link = "Normal" });

  vim.api.nvim_set_hl(0, 'StatusLine', { link = "Normal" });
  vim.api.nvim_set_hl(0, 'StatusLineNC', { link = "Normal" });

  -- Set transparent to floating elements and set WhichKey to follow it
  vim.api.nvim_set_hl(0, "WhichKeyFloat", { link = "NormalFloat" })
  vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "Keyword" })

  vim.cmd("hi IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine")
  vim.cmd("hi IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine")
  vim.cmd("hi IndentBlanklineIndent3 guifg=#98C379 gui=nocombine")
  vim.cmd("hi IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine")
  vim.cmd("hi IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine")
  vim.cmd("hi IndentBlanklineIndent6 guifg=#C678DD gui=nocombine")

  vim.api.nvim_set_hl(0, "rainbowcol1", { link = "IndentBlanklineIndent1" })
  vim.api.nvim_set_hl(0, "rainbowcol2", { link = "IndentBlanklineIndent2" })
  vim.api.nvim_set_hl(0, "rainbowcol3", { link = "IndentBlanklineIndent3" })
  vim.api.nvim_set_hl(0, "rainbowcol4", { link = "IndentBlanklineIndent4" })
  vim.api.nvim_set_hl(0, "rainbowcol5", { link = "IndentBlanklineIndent5" })
  vim.api.nvim_set_hl(0, "rainbowcol6", { link = "IndentBlanklineIndent6" })
end

M.setup = function()
  -- avoid running in headless mode since it's harder to detect failures
  if #vim.api.nvim_list_uis() == 0 then
    Log:debug "headless mode detected, skipping running setup for lualine"
    return
  end

  local selected_theme = lvim.builtin.theme.name or lvim.colorscheme

  -- if vim.startswith(lvim.colorscheme, selected_theme) then
  local status_ok, plugin = pcall(require, selected_theme)
  if not status_ok then
    return
  end
  pcall(function()
    plugin.setup(lvim.builtin.theme[selected_theme].options)
  end)
  -- end

  -- ref: https://github.com/neovim/neovim/issues/18201#issuecomment-1104754564
  local colors = vim.api.nvim_get_runtime_file(("colors/%s.*"):format(lvim.colorscheme), false)
  if #colors == 0 then
    Log:debug(string.format("Could not find '%s' colorscheme", lvim.colorscheme))
    return
  end

  vim.g.colors_name = selected_theme -- vim.cmd [[colorscheme dracula]]
  vim.cmd("colorscheme " .. selected_theme)

  set_highlights(lvim.transparent_window)

  require("lvim.core.lualine").setup()
  require("lvim.core.lir").icon_setup()
end

return M
