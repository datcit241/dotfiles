require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del
local create_user_command = vim.api.nvim_create_user_command

map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")

map("i", "fj", "<ESC>")
map("v", "fj", "<ESC>")

map("v", ">", ">gv", { desc = "Indent" })
map("v", "<", "<gv", { desc = "Indent" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

map("n", "P", "]P")

map("", "<C-\\>", require "utils.open_file_in_vertical_split")
map("", "<C-_>", require "utils.open_file_in_horizontal_split")
map("", "<C-P>", "<cmd>Telescope<CR>")

map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Explorer" })

if not require "utils.is_windows" then
  create_user_command("SudoWrite", "lua require'utils.sudo_write'()", {})
end

-- Buffer
map("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })
map("n", "<leader>n", "<cmd>enew<CR>", { desc = "New" })
nomap("n", "<leader>x")
nomap("n", "<leader>b")

-- Dap
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dd", "<cmd>lua require('dap').continue()<CR>", { desc = "Continue" })
map("n", "<leader>do", '<cmd>lua require("dap").step_over()<cr>', { desc = "Step over" })
map("n", "<leader>di", '<cmd>lua require("dap").step_into()<cr>', { desc = "Step into" })
map("n", "<leader>de", '<cmd>lua require("dap").step_out()<cr>', { desc = "Step out" })
map("n", "<leader>du", '<cmd>lua require("dapui").toggle()<cr>', { desc = "Toggle DapUI" })

-- Find
map("n", "<leader>fT", "<cmd>Telescope live_grep<CR>", { desc = "Find text in path" })
map("n", "<leader>ft", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find text" })
nomap("n", "<leader>fw")
nomap("n", "<leader>fz")

-- LSP
map("", "<leader>lf", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "Format" })
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
map("n", "<leader>lO", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })
map("n", "<leader>lp", "<cmd>Trouble diagnostics<CR>", { desc = "Problems" })
map("n", "<leader>lo", "<cmd>OrganizeImports<CR>", { desc = "Optimize imports" })
nomap("n", "<leader>fm")

-- IDE
map("n", "<leader>it", "<cmd>Telescope themes<CR>", { desc = "Themes" })
map("n", "<leader>ic", "<cmd>NvCheatsheet<CR>", { desc = "NvCheatsheet" })
map("n", "<leader>iw", "<cmd>WhichKey<CR>", { desc = "Whichkey" })
map("n", "<leader>ip", require "utils.open_plugin_page", { desc = "Visit Plugin" })
nomap("n", "<leader>th")
nomap("n", "<leader>rn")
nomap("n", "<leader>ch")
nomap("n", "<leader>wK")
nomap("n", "<leader>wk")

-- Git
map("n", "<leader>gg", function()
  --  get file name with extension
  local file = vim.fn.expand "%:t"
  vim.cmd "LazyGit"

  -- Wait a bit for LazyGit to load
  vim.defer_fn(function()
    -- search for the file, highlight, and exit search mode in lazygit
    vim.api.nvim_feedkeys("/" .. file, "t", true)
    vim.api.nvim_input "<CR>"
    vim.api.nvim_input "<ESC>"
  end, 150) -- (milliseconds)
end, { desc = "Lazy git" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>gr", require("gitsigns").reset_hunk, { desc = "Reset Hunk" })
map("n", "<leader>gd", require("gitsigns").preview_hunk, { desc = "Diff" })
map("n", "<leader>gB", package.loaded.gitsigns.blame_line, { desc = "Blame" })
nomap("n", "<leader>cm")
-- nomap("n", "<leader>gt")
-- nomap("n", "<leader>rh")
-- nomap("n", "<leader>ph")

-- Window
map({ "n" }, "<leader>wn", "<cmd>Telescope notify<CR>", { desc = "Notifications" })
map({ "n" }, "<leader>wD", "<cmd>DBUI<CR>", { desc = "Database" })
map({ "n", "t" }, "<leader>wtt", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Terminal" })
map({ "n", "t" }, "<leader>wtT", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Vertical terminal" })
map({ "n", "t" }, "<leader>wtf", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Floating terminal" })
map("n", "<leader>wtp", "<cmd>Telescope terms<CR>", { desc = "Pick terminal" })

-- Test
map({ "n" }, "<leader>tr", function()
  require("neotest").run.run()
end, { desc = "Run current test" })
map({ "n" }, "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run tests in file" })
map({ "n" }, "<leader>tF", function()
  require("neotest").run.run(vim.uv.cwd())
end, { desc = "Run tests in path" })
map({ "n" }, "<leader>tl", function()
  require("neotest").run.run_last()
end, { desc = "Run last test" })
map({ "n" }, "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Summary" })
map({ "n" }, "<leader>to", function()
  require("neotest").output_panel.toggle()
end, { desc = "Toggle output panel" })
map({ "n" }, "<leader>tO", function()
  require("neotest").output.open { enter = true, auto_close = true }
end, { desc = "Show output" })
map({ "n" }, "<leader>tS", function()
  require("neotest").run.stop()
end, { desc = "Stop" })
map({ "n" }, "<leader>tw", function()
  require("neotest").watch.toggle(vim.fn.expand "%")
end, { desc = "Toggle watch" })
map({ "n" }, "<leader>tu", function()
  require("neotest").summary.toggle()
  require("neotest").output_panel.toggle()
end, { desc = "Toggle UI" })
map({ "n" }, "<leader>td", function()
  require("neotest").run.run { strategy = "dap" }
end, { desc = "Debug" })

nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("n", "<leader>pt")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
