return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        { K.plugin_prefix, group = "plugins", icon = { icon = " ", color = "cyan" } },
        { K.lsp_prefix, group = "lsp", icon = { icon = " ", color = "yellow" } },
        { K.yank_prefix, group = "yank/paste", icon = { icon = "󱉨 ", color = "yellow" } },
        { K.copilotchat_prefix, group = "copilot", icon = { icon = " ", color = "yellow" } },
      },
      {
        mode = { "n" },
        { K.select_all, icon = { icon = "󰒆 ", color = "gray" } },
        { K.comment_toggle, icon = { icon = "󰆉 ", color = "gray" } },
        { K.ranger_toggle, icon = { icon = "󰙅 ", color = "yellow" } },
        { K.toggle_settings_prefix, group = "toggle/settings", icon = { icon = " ", color = "cyan" } },
        { K.gitsigns_prefix, group = "gitsigns", icon = { icon = " " } },
        { K.open_prefix, group = "open", icon = { icon = "󱓟 ", color = "cyan" } },
        { K.database_prefix, group = "database", icon = { icon = " ", color = "yellow" } },
        { K.lsp_problems_prefix, group = "problems", icon = { icon = " ", color = "red" } },
        { K.lsp_line_problem, icon = { icon = " ", color = "red" } },
        { K.toggle_screenkey, icon = { icon = " " } },
        { K.json_to_types_prefix, group = "convert Json", icon = { icon = " ", color = "yellow" } },
        { K.timer_prefix, group = "timer", icon = { icon = " " } },
      },
      {
        mode = "v",
        { K.codesnap_prefix, group = "codesnap", icon = { icon = "󰄄 ", color = "cyan" } },
      },
    },
  },
}
