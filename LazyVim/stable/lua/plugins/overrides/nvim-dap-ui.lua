if not LazyVim.has_extra("dap.core") then
  return {}
end

return {
  "rcarriga/nvim-dap-ui",
  opts = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = nil
    dap.listeners.before.event_exited["dapui_config"] = nil
  end,
}
