return {
	-- formater
	{
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

			vim.keymap.set({ "n", "v" }, "<leader>lf", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
				print("formated!!")
			end)
		end,
	},

	-- linter
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "biomejs" },
				typescript = { "biomejs" },
				javascriptreact = { "biomejs" },
				typescriptreact = { "biomejs" },
				svelte = { "biomejs" },
				solidity = { "solhint" },
				bash = { "shellcheck" },
				fish = { "fish" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
