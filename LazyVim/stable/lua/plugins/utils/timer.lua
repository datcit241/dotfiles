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
      { K.timer_prefix .. "t", "<cmd>TimerTemplate<CR>", desc = "Timer template" },
      { K.timer_prefix .. "s", "<cmd>TimerStart<CR>", desc = "Start timer" },
      { K.timer_prefix .. "p", "<cmd>TimerPause<CR>", desc = "Pause timer" },
      { K.timer_prefix .. "r", "<cmd>TimerResume<CR>", desc = "Resume timer" },
      { K.timer_prefix .. "S", "<cmd>TimerStop<CR>", desc = "Stop timer" },
      { K.timer_prefix .. "R", "<cmd>TimerRestart<CR>", desc = "Restart timer" },
      { K.timer_prefix .. "c", "<cmd>StartYourCustomTimer<CR>", desc = "Start custom timer" },
    },
  },
  { "wakatime/vim-wakatime", lazy = true, event = "VeryLazy" },
}
