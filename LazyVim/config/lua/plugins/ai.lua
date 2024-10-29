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
    keys = function()
      local function pick(kind)
        return function()
          local actions = require("CopilotChat.actions")
          local items = actions[kind .. "_actions"]()
          if not items then
            LazyVim.warn("No " .. kind .. " found on the current line")
            return
          end
          local ok = pcall(require, "fzf-lua")
          require("CopilotChat.integrations." .. (ok and "fzflua" or "telescope")).pick(items)
        end
      end

      return {
        { "<leader>pc", "", desc = "Copilot" },
        {
          "<leader>pca",
          function()
            local input = vim.fn.input("Quick Chat: ")
            if input ~= "" then
              require("CopilotChat").ask(input)
            end
          end,
          desc = "Quick Chat",
          mode = { "n", "v" },
        },
        {
          "<leader>pcc",
          function()
            return require("CopilotChat").toggle()
          end,
          desc = "Toggle CopilotChat",
          mode = { "n", "v" },
        },
        {
          "<leader>pcX",
          function()
            return require("CopilotChat").reset()
          end,
          desc = "Clear chat",
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
        {
          "<leader>pcp",
          pick("prompt"),
          desc = "Prompt",
          mode = { "n", "v" },
        },
        { "<leader>pcd", pick("help"), desc = "Diagnostic help", mode = { "n", "v" } },
      }
    end,
  },
}
