return {
  "nvimdev/indentmini.nvim",
  config = function()
    -- There is no default value.
    vim.cmd.highlight("IndentLine guifg=#1e1e2e")
    -- Current indent line highlight
    vim.cmd.highlight("IndentLineCurrent guifg=#b4f9f8")
    require("indentmini").setup() -- use default config
  end,
}

