return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  -- or                              , branch = '0.1.x',
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", "%.out", "bun*", ".git/" },
      },
    })

    local keymaps = vim.keymap.set
    keymaps("n", "<leader>sw", function()
      local words = vim.fn.expand("<cword>")
      builtin.grep_string({ search = words })
    end, { silent = true })
  end,
}
