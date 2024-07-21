local function load_highlights(theme)
  return function(_, opts)
    if type(theme) == "table" then
      for index, value in ipairs(theme) do
        dofile(vim.g.base46_cache .. value)
      end
      for i = 1, #theme do
      end
    else
      dofile(vim.g.base46_cache .. theme)
    end
    return opts
  end
end

return {
  {
    "NvChad/base46",
    lazy = false,
    branch = "v2.5",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "NvChad/ui",
    branch = "v2.5",
    lazy = false,
    config = function()
      require("nvchad")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = load_highlights("devicons"),
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = load_highlights("blankline"),
  },

  {
    "folke/which-key.nvim",
    opts = load_highlights("whichkey"),
  },
  {
    "williamboman/mason.nvim",
    opts = load_highlights("mason"),
  },
  {
    "hrsh7th/nvim-cmp",
    opts = load_highlights("cmp"),
  },
  {
    "neovim/nvim-lspconfig",
    opts = load_highlights("lsp"),
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = load_highlights({ "syntax", "treesitter" }),
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = load_highlights("git"),
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = load_highlights("nvimtree"),
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = load_highlights("statusline"),
  },
  {
    "akinsho/bufferline.nvim",
    opts = load_highlights("tbline"),
  },
}
