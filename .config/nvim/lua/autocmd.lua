


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})



local hi = vim.api.nvim_set_hl
hi(0, 'ColorColumn', { bg = 'gray' })
hi(0, 'Visual', { bg = '#1e1e2e' })
hi(0, 'Pmenu', { bg = '#1e1e2e' })

hi(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
-- blue
hi(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
hi(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
-- light blue
hi(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
hi(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
hi(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
-- pink
hi(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
hi(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
-- front
hi(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
hi(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
hi(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
hi(0, 'ColorColumn', { bg = 'gray' })

