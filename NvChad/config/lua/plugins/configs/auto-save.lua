return {
  "pocco81/auto-save.nvim",
  enabled = false,
  config = function()
    require("auto-save").setup({
      enabled = false,
      events = { "InsertLeave", "TextChanged" },
      conditions = {
        exists = true,
        filetype_is_not = {},
        modifiable = true,
      },
      write_all_buffers = false,
      on_off_commands = true,
    })
  end,
  lazy = true,
  event = {"InsertLeave", "TextChanged"},
  cmd = "ASToggle",
}
