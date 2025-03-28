local map = vim.keymap.set

map("n", "<leader>da", function()
  require("dap").continue({ before = get_args })
end, { desc = "Run with Args" })
map(
  "n",
  "<leader>db",
  "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<CR>",
  { desc = "Toggle breakpoint" }
)
map("n", "<leader>dd", "<cmd>lua require('dap').continue()<CR>", { desc = "Continue" })
map("n", "<leader>do", '<cmd>lua require("dap").step_over()<cr>', { desc = "Step over" })
map("n", "<leader>di", '<cmd>lua require("dap").step_into()<cr>', { desc = "Step into" })
map("n", "<leader>de", '<cmd>lua require("dap").step_out()<cr>', { desc = "Step out" })
map("n", "<leader>du", '<cmd>lua require("dapui").toggle()<cr>', { desc = "Toggle DapUI" })
map("n", "<leader>dc", function()
  require("dap").run_to_cursor()
end, { desc = "Run to Cursor" })
map("n", "<leader>dt", function()
  require("neotest").run.run({ strategy = "dap" })
end, { desc = "Debug" })
map("n", "<leader>dT", function()
  require("dap").terminate()
end, { desc = "Terminate" })
map("n", "<leader>dp", function()
  require("dap").pause()
end, { desc = "Pause" })
