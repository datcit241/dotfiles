return {
  "mfussenegger/nvim-dap",
  optional = true,
  opts = function()
    local dap = require("dap")

    dap.adapters.chrome = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath("data") .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
    }

    -- Function to prompt for port
    local function get_debug_port()
      local input = vim.fn.input("Enter the port for debugging (default: 3000): ")
      return tonumber(input) or 3000
    end

    dap.configurations.javascriptreact = {
      {
        type = "chrome",
        request = "launch",
        name = "Launch Chrome against localhost",
        url = function()
          local port = get_debug_port() -- Prompt for the port
          return "http://localhost:" .. port
        end,
        webRoot = "${workspaceFolder}",
        runtimeExecutable = "/usr/bin/google-chrome-stable", -- Path to Chrome
        runtimeArgs = { "--remote-debugging-port=9222", "--disable-web-security", "--user-data-dir=/tmp/chrome-debug" },
      },
    }
    --       dap.configurations.javascriptreact = {
    --   {
    --     type = 'chrome',
    --     request = 'attach',
    --     name = 'Attach to Chrome',
    --     program = '${file}',
    --     cwd = vim.fn.getcwd(),
    --     sourceMaps = true,
    --     protocol = 'inspector',
    --     port = get_debug_port(), -- Attach to the port
    --     webRoot = '${workspaceFolder}',
    --   },
    -- }

    dap.configurations.typescriptreact = dap.configurations.javascriptreact
  end,
}
