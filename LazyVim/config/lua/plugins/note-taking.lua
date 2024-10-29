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
      local io = require("utils.io")
      local is_windows = io.get_system_info().is_windows

      local paths = {
        is_windows and "F:\\Obsidian_Vault" or "/mnt/f/Obsidian_Vault",
        is_windows and "F:\\Personal_Vault" or "/mnt/f/Personal_Vault",
      }

      local workspaces = {}

      for _, path in ipairs(paths) do
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
    opts = function(_, opts)
      local loop = vim.loop
      local is_windows = require("utils.io").get_system_info().is_windows
      local path = is_windows and "F:\\Obsidian_Vault\\Main\\Notes\\Categories\\Nvim Notes\\"
        or "/mnt/f/Obsidian_Vault/Main/Notes/Categories/Nvim Notes/"

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

      -- local create_user_command = vim.api.nvim_create_user_command
      -- create_user_command("GlobalNoteCreate", function()
      --   local name = vim.fn.input("Note name: ")
      --   local destination = path .. name .. ".md"
      --
      --   local open_mode = loop.constants.O_CREAT + loop.constants.O_WRONLY + loop.constants.O_TRUNC
      --   local fd = loop.fs_open(destination, open_mode, 420)
      --   if not fd then
      --     if not loop.fs_stat(destination) then
      --       vim.api.nvim_err_writeln("Could not create note " .. destination)
      --       return
      --     else
      --       require("utils.notify").warn("Failed to complete file creation of " .. destination)
      --     end
      --   else
      --     loop.fs_close(fd)
      --     require("global-note").toggle_note(name)
      --   end
      -- end, { nargs = 0 })
      -- create_user_command("GlobalNoteSelect", function()
      --   require("global-note").toggle_note()
      -- end, { nargs = 0 })

      return opts
    end,
    -- config = function(opts)
    --   require("global-note").setup()
    --   local create_user_command = vim.api.nvim_create_user_command
    -- end,
    -- lazy = true,
    -- cmd = { "GlobalNote", "GlobalNoteCreate", "GlobalNoteSelect" },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function(_, opts)
      require("render-markdown").setup(opts)
    end,
  },
}
