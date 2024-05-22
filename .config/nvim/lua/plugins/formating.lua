return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        svelte = { "biome" },
        css = { "biome" },
        html = { "biome" },
        json = { "biome" },
        yaml = { "biome" },
        lua = { "stylua" },
        python = { "ruff_format", "ruff_fix" },
      },
    })

    vim.keymap.set({"n", "v"}, "<leader>lf", function ()
     conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
       print("formated!!")
    end)
  end
}
