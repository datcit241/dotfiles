---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>c"] = {
      function()
        require( "nvchad.tabufline" ).close_buffer()
      end,
      "Close buffer",
    },
  },
  i = {
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi" },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi" },
    -- navigation
    ["<A-Up>"] = { "<C-\\><C-N><C-w>k" },
    ["<A-Down>"] = { "<C-\\><C-N><C-w>j" },
    ["<A-Left>"] = { "<C-\\><C-N><C-w>h" },
    ["<A-Right>"] = { "<C-\\><C-N><C-w>l" },
    ["fj"] = {"<Esc>"},
  },
  v = {
    [">"] = { ">gv", "indent"},
    ["fj"] = {  "<esc>" },
  },
}

-- more keybinds!

return M
