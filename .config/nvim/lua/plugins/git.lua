return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = 'a' },
          change = { text = 'c' },
          delete = { text = 'd' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = 'u' },
        },
      }
      vim.keymap.set({ 'v', 'n' }, '<leader>gp', ':Gitsigns preview_hunk<cr>', { silent = true })
      vim.keymap.set({ 'n', 'v' }, '<leader>gP', ':Gitsigns preview_hunk_inline<cr>', { silent = true })
      vim.keymap.set('n', '<leader>g[', ':Gitsigns prev_hunk<cr>', { silent = true })
      vim.keymap.set('n', '<leader>g]', ':Gitsigns next_hunk<cr>', { silent = true })
    end,
  },
  {

    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', ':Git<cr>', { silent = true })
    end,
  },
}
