local is_windows = Utils.io.get_system_info().is_windows

local obsidian_paths = {
  is_windows and "F:\\Obsidian_Vault" or "/mnt/f/Obsidian_Vault",
  is_windows and "F:\\Personal_Vault" or "/mnt/f/Personal_Vault",
}
return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    keys = {
      { "<leader>po", "", desc = "Obsidian" },
      { "<leader>po<space>", "", desc = "Toggle check box" },
    },
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = function(_, opts)
      local workspaces = {}

      for _, path in ipairs(obsidian_paths) do
        if vim.loop.fs_stat(path) then
          table.insert(workspaces, { name = vim.fn.fnamemodify(path, ":t"), path = path })
        end
      end

      opts = vim.tbl_deep_extend("force", {}, opts, {
        workspaces = workspaces,
        ui = { enable = false },
      })

      opts.mappings = {
        ["<leader>po<space>"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      }

      return opts
    end,
  },
  {
    -- "backdround/global-note.nvim",
    -- dir = "/home/dunix/projects/nvim/global-note.nvim/",
    "dunix241/global-note.nvim",
    lazy = true,
    cmd = { "GlobalNote", "GlobalNoteCreate", "GlobalNotePick" },
    keys = {
      { "<leader>pg", "", desc = "Global note" },
      { "<leader>pgg", "<cmd>GlobalNote<CR>", desc = "Global note" },
      { "<leader>pgc", "<cmd>GlobalNoteCreate<CR>", desc = "Create note" },
      { "<leader>pgp", "<cmd>GlobalNotePick<CR>", desc = "Create note" },
    },
    opts = function(_, opts)
      local loop = vim.loop
      local is_windows = require("utils.io").get_system_info().is_windows
      local path = obsidian_paths[1]

      if not loop.fs_stat(path) then
        return opts
      end

      local get_project_name = function()
        local project_directory, err = vim.loop.cwd()
        if project_directory == nil then
          vim.notify(err, vim.log.levels.WARN)
          return nil
        end

        local project_name = vim.fs.basename(project_directory)
        if project_name == nil then
          vim.notify("Unable to get the project name", vim.log.levels.WARN)
          return nil
        end

        return project_name
      end

      opts = vim.tbl_deep_extend("force", opts, {
        directory = path,
        additional_presets = {
          project_local = {
            command_name = "ProjectNote",

            filename = function()
              return get_project_name() .. ".md"
            end,

            title = "Project note",
          },
        },
      })
      return opts
    end,
  },
}
