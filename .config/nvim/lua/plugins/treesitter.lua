return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "tsx",
        "javascript",
        "typescript",
        "fish",
        "bash",
        "css",
        "json",
        "html",
        "prisma",
        "lua",
        "dockerfile",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {
        enable = true,
      },
    })
  end,
}
