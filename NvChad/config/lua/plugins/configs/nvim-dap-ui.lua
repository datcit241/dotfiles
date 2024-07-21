return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    {"mfussenegger/nvim-dap"},
    {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
      lazy = false
    },
    {"nvim-neotest/nvim-nio"},
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
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
}
