return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  events = "InsertEnter",
  config = function()
    require('treesj').setup {}
  end,
}
