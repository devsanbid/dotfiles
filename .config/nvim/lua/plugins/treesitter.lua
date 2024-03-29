return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    local configs = require 'nvim-treesitter.configs'
    configs.setup {
      ensure_installed = {
        'tsx',
        'javascript',
        'typescript',
        'fish',
        'markdown',
        'bash',
        'norg',
        'css',
        'json',
        'jsonc',
        'vim',
        'vimdoc',
        'yaml',
        'query',
        'regex',
        'toml',
        'rasi',
        'luadoc',
        'jsdoc',
        'html',
        'prisma',
        'lua',
        'dockerfile',
      },
      lsp_interop = {
        enable = true,
        border = 'rounded',
        peek_definition_code = {},
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<M-space>',
          node_incremental = '<M-space>',
          scope_incremental = false,
          node_decremental = '<M-bs>',
        },
      },
      auto_install = true,
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {
        enable = true,
      },
    }
    vim.filetype.add {
      extension = { rasi = 'rasi' },
      pattern = {
      },
    }
  end,
}
