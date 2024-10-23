return {
  { "nvchad/volt", lazy = true },
  {
    "nvchad/menu",
    lazy = true,
    keys = {
      { "<C-t>", '<cmd>lua require("menu").open("default")<CR>' },
      {
        "<RightMouse>",
        function()
          vim.cmd.exec('"normal! \\<RightMouse>"')

          local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
          require("menu").open(options, { mouse = true })
        end,
      },
    },
  },
  {
    "NvChad/minty",
    lazy = true,
    cmd = { "Shades", "Huefy" },
  },
}
