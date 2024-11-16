if not LazyVim.has_extra("coding.copilot-chat") then
  return {}
end

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
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
        "<cmd>CopilotChatSave<cr>",
        desc = "Save chat",
        mode = { "n", "v" },
      },
      {
        "<leader>pcl",
        "<cmd>CopilotChatLoad<cr>",
        desc = "Load chat",
        mode = { "n", "v" },
      },
    },
  },
}
