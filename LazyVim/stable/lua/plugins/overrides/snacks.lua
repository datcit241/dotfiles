return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
██████╗  █████╗ ████████╗██╗   ██╗ ██████╗ 
██╔══██╗██╔══██╗╚══██╔══╝██║   ██║██╔═══██╗
██║  ██║███████║   ██║   ██║   ██║██║   ██║
██║  ██║██╔══██║   ██║   ╚██╗ ██╔╝██║   ██║
██████╔╝██║  ██║   ██║    ╚████╔╝ ╚██████╔╝
╚═════╝ ╚═╝  ╚═╝   ╚═╝     ╚═══╝   ╚═════╝ 
███╗   ██╗██╗   ██╗██╗███╗   ███╗
████╗  ██║██║   ██║██║████╗ ████║
██╔██╗ ██║██║   ██║██║██╔████╔██║
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
      },
    },
  },
  keys = {
    { "<leader>on", "<cmd>lua Snacks.notifier.show_history()<cr>", desc = "Snack history" },
  },
}
