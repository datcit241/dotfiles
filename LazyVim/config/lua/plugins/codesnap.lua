-- Install Rust: https://www.rust-lang.org/tools/install
local is_windows = require("utils.io").get_system_info().is_windows

local win_config = {
  "mistricky/codesnap.nvim",
  version = "0.0.11",
  build = "make",
  lazy = true,
  cmd = { "CodeSnapPreviewOn" },
  keys = {
    {
      "<leader>ps",
      "<cmd>CodeSnapPreviewOn<cr>",
      mode = "x",
      desc = "Open code snapshot review page",
    },
  },
  opts = function()
    local nvim_version = vim.version()
    local version = nvim_version.major .. "." .. nvim_version.minor .. "." .. nvim_version.patch
    return {
      watermark = "󰩖    󰄀  Dat Vo      Neovim " .. version .. "   󰩖",
    }
  end,
}
local linux_config = {
  "mistricky/codesnap.nvim",
  -- dir = "/home/dunix/projects/nvim/codesnap.nvim",
  build = "make",
  lazy = true,
  cmd = { "CodeSnapSave", "CodeSnapSaveHighlight", "CodeSnap", "CodeSnapHighlight", "CodeSnapASCII" },
  keys = {
    { "<leader>ps", "", desc = "Code snap" },
    { "<leader>pss", "<esc><cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    {
      "<leader>psh",
      "<esc><cmd>CodeSnapSaveHighlight<cr>",
      mode = "x",
      desc = "Save selected code and highlight in ~/Pictures ",
    },
  },
  opts = function()
    local nvim_version = vim.version()
    local version = nvim_version.major .. "." .. nvim_version.minor .. "." .. nvim_version.patch
    return {
      save_path = "~/Pictures",
      has_line_number = true,
      has_breadcrumbs = true,
      breadcrumbs_separator = " › ",
      bg_theme = "peach", -- "bamboo", "sea" *, "peach" *, "grape" *, "dusk" *, "summer"
      -- bg_x_padding = 24,
      -- bg_y_padding = 24,
      bg_x_padding = 0,
      bg_y_padding = 0,
      bg_padding = nil,
      title = " Neovim",
      watermark = "󰄀  Dat Vo      Neovim " .. version .. "    󰩖",
    }
  end,
}

return is_windows and win_config or linux_config
