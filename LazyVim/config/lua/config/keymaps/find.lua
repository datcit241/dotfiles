local map = vim.keymap.set

map("", "<C-P>", "<cmd>Telescope<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", { desc = "Buffers" })
map("n", "<leader>fc", LazyVim.pick.config_files(), { desc = "Find Config File" })
map("n", "<leader>ff", LazyVim.pick("files", { root = false }), { desc = "Find Files" })
map("n", "<leader>fo", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), { desc = "Old files" })
map("n", "<leader>fT", "<cmd>Telescope live_grep<CR>", { desc = "Find text in path" })
map("n", "<leader>ft", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find text" })

map("n", "<leader>fs", function()
  require("spectre").open()
end, { desc = "Replace in Files" })
map("n", "<leader>fs", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, { desc = "Replace in Files" })

-- Shortcuts
map("n", "<leader><leader>", LazyVim.pick("files", { root = false }), { desc = "Find Files" })
map(
  "n",
  "T",
  "<cmd>Telescope buffers sort_lastused=true sort_mru=true ignore_current_buffer=true<cr>",
  { desc = "Buffers" }
) -- inspired by `vimium C` 😎
map("n", "<leader>,", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), { desc = "Old files" })
map("n", "<leader>;", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find text" })
map("n", "<leader>:", "<cmd>Telescope live_grep<CR>", { desc = "Find text in path" })
