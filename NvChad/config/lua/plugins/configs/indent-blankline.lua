return {
  "lukas-reineke/indent-blankline.nvim",
  opts = function(_, opts)
    -- Other blankline configuration here

    local highlight = {
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      -- "RainbowViolet",
      "RainbowCyan",
      "RainbowRed",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    opts = require("indent-rainbowline").make_opts(opts, {
      color_transparency = 0.2,
      colors = {
        0xE5C07B,
        0x61AFEF,
        0xD19A66,
        0x98C379,
        -- 0xC678DD,
        0x56B6C2,
        0xE06C75,
      },
    })

    opts.indent = { highlight = highlight }
    opts.scope = { highlight = "RainbowViolet" }

    return opts
  end,
  dependencies = { "TheGLander/indent-rainbowline.nvim" },
  lazy = true,
}
