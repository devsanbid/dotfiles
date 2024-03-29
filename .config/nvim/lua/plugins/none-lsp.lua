return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      debug = false,
      sources = {
        formatting.stylua,
        formatting.shfmt,
        formatting.black,
        formatting.clang_format,
        formatting.rustywind,
        formatting.prettier,
        code_actions.ts_node_action,
        formatting.biome.with({
					args = {
						'check',
						'--apply-unsafe',
						'--formatter-enabled=true',
						'--organize-imports-enabled=true',
						'--skip-errors',
						'$FILENAME',
					},
				}),
        -- formatting.prettier.with {
        --   extra_filetypes = { "toml" },
        --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        -- },
      },
    })
  end,
}
