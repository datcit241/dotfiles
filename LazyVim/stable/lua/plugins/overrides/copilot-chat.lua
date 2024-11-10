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
    keys = {
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
