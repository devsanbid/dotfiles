return {
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  { -- LSP Support
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    keys = {
      { "<leader>i", "<cmd>LspInfo<cr>",    "Lsp Info" },
      { "<leader>I", "<cmd>LspInstall<cr>", "Lsp Install" },
    },
  },

  { -- LSP Config
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { "rafamadriz/friendly-snippets" }, -- useful snippets
      { 'SirVer/ultisnips' },
      { 'quangnguyen30192/cmp-nvim-ultisnips' },
    }
  }
}
