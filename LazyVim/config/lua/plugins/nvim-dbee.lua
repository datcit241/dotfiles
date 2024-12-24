return {
  {
    "kndndrj/nvim-dbee",
    -- dir = "/mnt/f/Projects/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup(--[[optional config]])
    end,
    lazy = true,
    cmd = "Dbee",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "MattiasMTS/cmp-dbee",
        dependencies = {
          { "kndndrj/nvim-dbee" },
        },
        ft = "sql", -- optional but good to have
        opts = {}, -- needed
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "cmp-dbee",
        group_index = 1,
        priority = 100,
      })
    end,
  },
}
