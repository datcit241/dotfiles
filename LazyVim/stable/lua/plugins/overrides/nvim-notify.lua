return {
  "rcarriga/nvim-notify",
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
