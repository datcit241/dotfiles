return {
  "Redoxahmii/json-to-types.nvim",
  build = "npm install",
  lazy = true,
  cmd = { "ConvertJSONtoLang", "ConvertJSONtoLangBuffer" },
  keys = {
    { K.json_to_types_prefix .. "c", "<cmd>ConvertJSONtoLang cs<CR>", desc = "C#" },
    { K.json_to_types_prefix .. "j", "<cmd>ConvertJSONtoLang java<CR>", desc = "Java" },
    { K.json_to_types_prefix .. "s", "<cmd>ConvertJSONtoLang javascript<CR>", desc = "Javascript" },
    { K.json_to_types_prefix .. "t", "<cmd>ConvertJSONtoLang typescript<CR>", desc = "Typescript" },
  },
}
