return {
  "Redoxahmii/json-to-types.nvim",
  build = "npm install",
  lazy = true,
  cmd = { "ConvertJSONtoLang", "ConvertJSONtoLangBuffer" },
  keys = {
    { "<leader>pj", "", desc = "Convert JSON" },
    { "<leader>pjc", "<cmd>ConvertJSONtoLang cs<CR>", desc = "C#" },
    { "<leader>pjj", "<cmd>ConvertJSONtoLang java<CR>", desc = "Java" },
    { "<leader>pjs", "<cmd>ConvertJSONtoLang javascript<CR>", desc = "Javascript" },
    { "<leader>pjt", "<cmd>ConvertJSONtoLang typescript<CR>", desc = "Typescript" },
  },
}
