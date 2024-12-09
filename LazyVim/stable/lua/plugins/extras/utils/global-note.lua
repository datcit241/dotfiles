return {
  -- "backdround/global-note.nvim",
  "dunix241/global-note.nvim",
  lazy = true,
  cmd = { "GlobalNote", "GlobalNoteCreate", "GlobalNotePick" },
  keys = {
    { "<leader>pg", "", desc = "Global note" },
    { "<leader>pgg", "<cmd>GlobalNote<CR>", desc = "Global note" },
    { "<leader>pgc", "<cmd>GlobalNoteCreate global<CR>", desc = "Create global note" },
    { "<leader>pgC", "<cmd>GlobalNoteCreate local<CR>", desc = "Create local note" },
    { "<leader>pgp", "<cmd>GlobalNotePick global<CR>", desc = "Pick global note" },
    { "<leader>pgP", "<cmd>GlobalNotePick local<CR>", desc = "Pick local note" },
  },
  opts = function(_, opts)
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

    opts = vim.tbl_deep_extend("force", opts or {}, {
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

    local path = vim.g.obsidian_vaults[1] .. "Main/Notes/Categories/Nvim Notes"

    local stat = vim.loop.fs_stat(path)
    if stat ~= nil and stat.type == "directory" then
      opts.directory = path
    end

    return opts
  end,
}
