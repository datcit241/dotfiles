return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    optional = true, -- or check LazyVim.has_extra("coding.copilot-chat")
    opts = {
      mappings = {
        reset = {
          normal = "",
          insert = "",
        },
      },
    },
    cmd = { "CopilotChatLoad", "CopilotChatModel", "CopilotChatModels" },
    keys = {
      {
        "<leader>pcc",
        function()
          local focused = U.win_buf.window.try_focusing("copilot%-chat")
          if not focused then
            require("CopilotChat").toggle()
          end
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>pcs",
        ":CopilotChatSave",
        desc = "Save chat",
        mode = { "n", "v" },
      },
      {
        "<leader>pcl",
        ":CopilotChatLoad",
        desc = "Load chat",
        mode = { "n", "v" },
      },
    },
  },
}
