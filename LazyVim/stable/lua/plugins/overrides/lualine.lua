return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local colors = require("colors.palette-options").palette

    local bg = colors.dark1 -- default "#2C2E33"
    local shouldTransparent = require("chadrc").base46 and require("chadrc").base46.transparency
    local c_bg = shouldTransparent and "NONE" or colors.dark2

    local theme = {
      normal = {
        a = { fg = bg, bg = colors.blue },
        b = { fg = colors.blue, bg = bg },
        c = { fg = colors.light1, bg = c_bg },
      },
      insert = {
        a = { fg = bg, bg = colors.green },
        b = { fg = colors.green, bg = bg },
        c = { fg = colors.light1, bg = c_bg },
      },
      visual = {
        a = { fg = bg, bg = colors.cyan },
        b = { fg = colors.cyan, bg = bg },
        c = { fg = colors.light1, bg = c_bg },
      },
      inactive = {
        a = { fg = colors.dark5, bg = bg },
        b = { fg = colors.dark5, bg = bg },
        c = { fg = colors.dark5, bg = c_bg },
      },
      terminal = {
        a = { fg = bg, bg = colors.red },
        b = { fg = colors.red, bg = bg },
        c = { fg = colors.light1, bg = c_bg },
      },
    }

    theme.command = theme.terminal
    theme.replace = theme.insert

    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = theme,
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },

        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return LazyVim.ui.fg("Statement") end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return LazyVim.ui.fg("Constant") end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return LazyVim.ui.fg("Debug") end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return LazyVim.ui.fg("Special") end,
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }

    return opts
  end,
}
