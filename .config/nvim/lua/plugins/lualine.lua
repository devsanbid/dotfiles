return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      icons_enabled = false,
      sections = {
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_a = {},
        lualine_z = {},
        lualine_b = {
          'grapple',
        },
      },
    }
  end,
}
