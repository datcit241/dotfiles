-- Install Rust: https://www.rust-lang.org/tools/install
local is_windows = require("utils.io").get_system_info().is_windows

local function get_watermark()
  local nvim_version = vim.version()
  local version = nvim_version.major .. "." .. nvim_version.minor .. "." .. nvim_version.patch
  return "󰩖    󰄀  Dat Vo      Neovim " .. version .. "   󰩖"
end

local win_config = {
  "mistricky/codesnap.nvim",
  version = "0.0.11",
  build = "make",
  lazy = true,
  cmd = { "CodeSnapPreviewOn" },
  keys = {
    {
      K.codesnap_prefix,
      "<cmd>CodeSnapPreviewOn<cr>",
      mode = "x",
      desc = "Open code snapshot review page",
    },
  },
  opts = {
    watermark = get_watermark(),
  },
}
local linux_config = {
  "mistricky/codesnap.nvim",
  -- dir = "/home/dunix/projects/nvim/codesnap.nvim",
  build = "make",
  lazy = true,
  cmd = { "CodeSnapSave", "CodeSnapSaveHighlight", "CodeSnap", "CodeSnapHighlight", "CodeSnapASCII" },
  keys = {
    {
      K.codesnap_prefix .. "s",
      "<esc><cmd>CodeSnapSave<cr>",
      mode = "x",
      desc = "Save selected code snapshot in ~/Pictures",
    },
    {
      K.codesnap_prefix .. "h",
      "<esc><cmd>CodeSnapSaveHighlight<cr>",
      mode = "x",
      desc = "Save selected code and highlight in ~/Pictures ",
    },
  },
  opts = function()
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
      watermark = get_watermark(),
    }
  end,
}

return is_windows and win_config or linux_config
