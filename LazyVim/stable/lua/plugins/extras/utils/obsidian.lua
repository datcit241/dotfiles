local config = {
  event = {},
  workspaces = {},
}

for _, path in ipairs(vim.g.obsidian_vaults or {}) do
  local stat = vim.loop.fs_stat(path)
  local exists = stat ~= nil and stat.type == "directory"
  if exists then
    table.insert(config.event, "BufReadPre " .. path .. "**.md")
    table.insert(config.event, "BufNewFile " .. path .. "**.md")
    table.insert(config.workspaces, { name = vim.fn.fnamemodify(path, ":t"), path = path })
  end
end

return #config.workspaces == 0 and {}
  or {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    keys = {
      { "<leader>po", "", desc = "Obsidian" },
      { "<leader>po<space>", "", desc = "Toggle check box" },
    },
    -- load obsidian.nvim only for markdown files in the vault(s)
    event = config.event,
    -- Replace the above line with this to load for all markdown files
    -- ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {

      workspaces = config.workspaces,
      ui = { enable = false },
      mappings = {
        ["<leader>po<space>"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
    },
  }
