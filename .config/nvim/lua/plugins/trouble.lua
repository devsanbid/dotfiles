return {
  "folke/trouble.nvim",
  config = function()

    require("trouble").setup({
      position = "bottom",
      icons = false,
      padding = true,
    })

  end,
}
