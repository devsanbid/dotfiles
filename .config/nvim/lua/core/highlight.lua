local hi = vim.api.nvim_set_hl

hi(0, 'NeoTreeSignColumn', { bg = '#1e1e2e' })
hi(0, '@type.builtin', { fg = '#FF7276' })
hi(0, '@variable.builtin', { fg = '#FF7276' })

hi(0, 'MatchParen', { bg = 'none', fg = 'yellow' })
hi(0, 'Visual', { bg = '#1e1e2e' })
hi(0, 'Pmenu', { bg = '#1e1e2e' })
-- gray
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

local transparent_hightlight = {
  'TelescopePromptNormal',
  'lualine_b_normal',
  'lualine_a_normal',
  'lualine_a_visual',
  'lualine_c_normal',
  'LspInlayHint',
  'lualine_c_visual',
  'lualine_c_command',
  'lualine_a_command',
  'lualine_b_command',
  'DiagnosticVirtualTextError',
  'DiagnosticVirtualTextWarn',
  'DiagnosticVirtualTextInfo',
  'DiagnosticVirtualTextOk',
}

for _, items in pairs(transparent_hightlight) do
  vim.cmd.hi(items .. ' guibg=none')
end
