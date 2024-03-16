return {
  {

    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        styles = {
          bold = false,
          italic = false,
          transparency = true,
        },
      }
      vim.cmd 'colorscheme rose-pine'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
