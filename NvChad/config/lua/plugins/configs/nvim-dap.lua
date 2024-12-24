return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      -- dap.adapters.cpp = {
      --   type = "executable",
      --   attach = { pidProperty = "pid", pidSelect = "ask" },
      --   command = "lldb-vscode",
      --   name = "lldb",
      -- }
      require "configs.plugins.nvim-dap.js-dap"
      require "configs.plugins.nvim-dap.cs-dap"
    end,
    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      local dapIcons = {
        Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
        Breakpoint = " ",
        BreakpointCondition = " ",
        BreakpointRejected = { " ", "DiagnosticError" },
        LogPoint = ".>",
      }

      for name, sign in pairs(dapIcons) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      { "mfussenegger/nvim-dap" },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup()
        end,
        lazy = false,
      },
      { "nvim-neotest/nvim-nio" },
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close()
      -- end
    end,
  },
}
