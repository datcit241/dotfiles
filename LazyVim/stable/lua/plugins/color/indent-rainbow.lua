-- local colors = require("colors.palette-options").palette

return {
  {
    "shellRaining/hlchunk.nvim",
    lazy = true,
    event = "User HighlightsInitiated",
    keys = {
      { "<leader>Si", "", desc = "Indent rainbow" },
    },
    opts = function(_, opts)
      local colors = require("colors").colors
      local extra_palette = require("colors.extra-palette")

      opts = vim.tbl_deep_extend("force", {}, opts, {
        chunk = {
          enable = true,
          style = {
            { fg = colors.specialChar },
            -- { fg = "#c21f30" },

            -- { fg = "#7f1d1d" },
            -- { fg = "#991b1b" },
            -- { fg = "#b91c1c" },

            -- { fg = "#8b0836" },
            { fg = "#a50036" },
            -- { fg = "#c70036" },
          },
        },
        indent = {
          enable = false,
          style = {
            colors.red,
            colors.yellow,
            colors.blue,
            colors.orange,
            colors.green,
            -- colors.violet
            colors.cyan,
            -- "#E06C75",
            -- "#E5C07B",
            -- "#61AFEF",
            -- "#D19A66",
            -- "#98C379",
            -- -- "#C678DD",
            -- "#56B6C2",
          },
        },
        blank = {
          enable = true,
          chars = {
            -- "  ",
            -- "․",
            "⁚",
            -- "⁖",
            -- "⁘",
            -- "⁙",
          },
          style = {
            { fg = extra_palette.gray_500 },
            -- { bg = "", fg = "" },
          },
          -- style = {
          --   colors.red,
          --   colors.yellow,
          --   colors.blue,
          --   colors.orange,
          --   colors.green,
          --   -- colors.violet
          --   colors.cyan,
          --   -- "#E06C75",
          --   -- "#E5C07B",
          --   -- "#61AFEF",
          --   -- "#D19A66",
          --   -- "#98C379",
          --   -- -- "#C678DD",
          --   -- "#56B6C2",
          -- },
        },
      })
      return opts
    end,
    config = function(_, opts)
      local function register_mod(mod_name, lhs, name)
        local Mod = require("hlchunk.mods." .. mod_name)
        local mod = Mod(opts[mod_name])

        if opts[mod_name] and opts[mod_name].enable then
          mod:enable()
        end

        local snacks = require("snacks")
        snacks
          .toggle({
            name = name or ("Highlight " .. mod_name),
            get = function()
              return mod.conf.enable
            end,
            set = function(state)
              if state then
                mod:enable()
              else
                mod:disable()
              end
            end,
          })
          :map(lhs)
      end
      register_mod("chunk", "<leader>Sic", "highlight chunk")
      register_mod("indent", "<leader>Sii", "highlight indent")
      register_mod("blank", "<leader>Sib", "highlight blank")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    lazy = true,
    event = "BufRead",
    opts = function(_, opts)
      -- Other blankline configuration here

      local highlight = {
        "RainbowRed", -- #E06C75
        "RainbowYellow", -- #E5C07B
        "RainbowBlue", -- #61AFEF
        "RainbowOrange", -- #D19A66
        "RainbowGreen", -- #98C379
        -- "RainbowViolet", -- #C678DD
        "RainbowCyan", -- #56B6C2
      }

      local hooks = require("ibl.hooks")
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

      -- opts = require("indent-rainbowline").make_opts(opts, {
      --   color_transparency = 0.5,
      --   colors = {
      --     0xE06C75, -- #E06C75
      --     0xE5C07B, -- #E5C07B
      --     0x61AFEF, -- #61AFEF
      --     0xD19A66, -- #D19A66
      --     0x98C379, -- #98C379
      --     -- 0xC678DD, -- #C678DD
      --     0x56B6C2, -- #56B6C2
      --   },
      -- })

      opts.indent = { highlight = highlight }
      opts.scope = { highlight = "RainbowViolet" }

      return opts
    end,
    dependencies = { "TheGLander/indent-rainbowline.nvim" },
  },
}
