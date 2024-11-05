return {
  "dunix241/nvim-notify",
  branch = "feat/add-support-fzf",
  keys = {
    {
      "<leader>on",
      function()
        require("notify.integrations").pick()
      end,
      desc = "Show notifications",
    },
  },
}
