local map = vim.keymap.set
local create_user_command = vim.api.nvim_create_user_command

map("i", "fj", "<ESC>")
map("v", "fj", "<ESC>")

map("n", "fj", "<cmd>nohl<CR>")
map("n", "<esc>", "<cmd>nohl<CR>")

map("v", ">", ">gv", { desc = "Indent" })
map("v", "<", "<gv", { desc = "Indent" })

map("n", "<leader>a", "ggVG", { desc = "Select all" })

map("n", "<leader>ya", "<cmd>%y+<CR>", { desc = "Yank all" })
map("v", "<leader>yy", '"+y', { desc = "Yank selected" })
map("n", "<leader>yy", '"+yy', { desc = "Yank" })
map("n", "<leader>yp", '"+p', { desc = "Paste" })
map("n", "<leader>yP", '"+P', { desc = "Paste" })

map("n", "<leader>/", "gcc", { desc = "Comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "Comment toggle", remap = true })

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

local io = require("utils.io")

if not io.get_system_info().is_windows then
  create_user_command("SudoWrite", "lua require'utils.sudo'.sudo_write()", {})
end

local function select_next_html_element_and_merge()
  -- Remember the current selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Ensure we are in normal mode before performing 'vat'
  vim.cmd("stopinsert")

  -- Move the cursor down one line
  vim.cmd("normal! j")

  -- Perform 'vat' to select the next HTML element
  vim.cmd("normal! vat")
  -- vim.api.nvim_feedkeys("vat", "n", false)
  -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("vat", true, false, true), "n", false)
  --
  -- Get the new selection positions
  local new_start_pos = vim.fn.getpos("'<")
  local new_end_pos = vim.fn.getpos("'>")

  -- Determine the new merged selection range
  local final_start_pos = { math.min(start_pos[2], new_start_pos[2]), math.min(start_pos[3], new_start_pos[3]) }
  local final_end_pos = { math.max(end_pos[2], new_end_pos[2]), math.max(end_pos[3], new_end_pos[3]) }

  -- Select the merged range
  vim.fn.setpos("'<", { 0, final_start_pos[1], final_start_pos[2], 0 })
  vim.fn.setpos("'>", { 0, final_end_pos[1], final_end_pos[2], 0 })
  vim.cmd("normal! gv")
end

local function select_next_html_element()
  -- Save the current selection
  vim.cmd("normal! gv")

  -- Exit insert mode if necessary
  vim.cmd("stopinsert")

  -- Go down one line
  vim.cmd("normal! j")

  -- Select the next HTML element (using 'vat')
  vim.cmd("normal! vat")

  -- Merge the new selection with the previous selection
  vim.cmd("normal! gv")
end

-- Map the function to a keybinding in visual mode
map("v", "<leader>o", function()
  select_next_html_element()
end, { noremap = true, silent = true })

local get_url = function()
  local cursor_word = vim.fn.expand("<cfile>")
  if string.find(cursor_word, "^[^/]+/[^/]+$") then
    cursor_word = "https://github.com/" .. cursor_word
  end
  return cursor_word or ""
end

-- map("n", "gx", function()
--   io.shell_open(get_url())
-- end, { silent = true })

map("n", "gx", "<cmd>URLOpenUnderCursor<CR>", { silent = true })
