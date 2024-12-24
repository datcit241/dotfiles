return {
  {
    "SunnyTamang/pendulum.nvim",
    opts = {},
    lazy = true,
    cmd = {
      "TimerStart",
      "TimerPause",
      "TimerResume",
      "TimerStop",
      "TimerRestart",
      "TimerTemplate",
      "StartYourCustomTimer",
    },
    keys = {
      { "<leader>pt", "", desc = "Timer" },
      { "<leader>ptt", "<cmd>TimerTemplate<CR>", desc = "Timer template" },
      { "<leader>pts", "<cmd>TimerStart<CR>", desc = "Start timer" },
      { "<leader>ptp", "<cmd>TimerPause<CR>", desc = "Pause timer" },
      { "<leader>ptr", "<cmd>TimerResume<CR>", desc = "Resume timer" },
      { "<leader>ptS", "<cmd>TimerStop<CR>", desc = "Stop timer" },
      { "<leader>ptR", "<cmd>TimerRestart<CR>", desc = "Restart timer" },
      { "<leader>ptc", "<cmd>StartYourCustomTimer<CR>", desc = "Start custom timer" },
    },
  },
  { "wakatime/vim-wakatime", lazy = true, event = "VeryLazy" },
}
