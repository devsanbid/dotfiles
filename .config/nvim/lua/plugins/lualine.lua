return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      icons_enabled = false,
      sections = {
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_a = {},
        lualine_z = {},
        lualine_b = {
          {
            function()
              local key = require("grapple").name_or_index ()
              return "  [" .. key .. "]"
            end,
            cond = require("grapple").exists,
          },
        },
      },
    })
  end,
}
