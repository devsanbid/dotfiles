return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets', -- useful snippets
      'SirVer/ultisnips',
      'quangnguyen30192/cmp-nvim-ultisnips',
      'hrsh7th/cmp-cmdline',
      { 'mtoohey31/cmp-fish', ft = 'fish' },
      'rcarriga/cmp-dap',
      'jcha0713/cmp-tw2css',
      'SergioRibera/cmp-dotenv',
      'hrsh7th/cmp-nvim-lua',
    },
  },

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup {
        floating_window = false,
        hint_prefix = '🐼 ',
        transparency = 100,
      }
    end,
  },
}
