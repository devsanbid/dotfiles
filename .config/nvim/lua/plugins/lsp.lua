return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'rust_analyzer',
          'cssls',
          'graphql',
          'dockerls',
          'bashls',
          'astro',
          'ansiblels',
          'ruff',
          'html',
          'prismals',
          'marksman',
          'astro',
          'jqls',
          'yamlls',
          'tailwindcss',
          'pylsp',
          'tsserver',
          'clangd',
          'taplo',
          'biome',
        },
      }
    end,
  },

  { -- LSP Support
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    keys = {
      { '<leader>i', '<cmd>LspInfo<cr>',    'Lsp Info' },
      { '<leader>I', '<cmd>LspInstall<cr>', 'Lsp Install' },
    },
  },

  { -- LSP Config
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
  },
}
