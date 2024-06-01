return {
    enabled = false,
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
        require("codeium").setup({})
		require("cmp").setup({
			sources = {
				{ name = "codeium" },
				{ name = "nvim_lsp" },
			},
		})
	end,
}
