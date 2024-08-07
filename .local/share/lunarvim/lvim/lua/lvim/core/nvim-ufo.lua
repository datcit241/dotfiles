local present, ufo = pcall(require, 'ufo')
if not present then
  return
end

-- ╭──────────────────────────────────────────────────────────╮
-- │ Keymappings                                              │
-- ╰──────────────────────────────────────────────────────────╯
-- Using ufo provider need remap `zR` and `zM`. zr is additional.
vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)
vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds)

local M = {}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Custom handler function                                  │
-- ╰──────────────────────────────────────────────────────────╯
M.handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ('  %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0

  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end

  table.insert(newVirtText, { suffix, 'MoreMsg' })

  return newVirtText
end

function M.setup()
  vim.o.foldcolumn = '1' -- '0' is not bad
  vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldlevelstart = -1
  vim.o.foldenable = true
  require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end
  })
end

return M
