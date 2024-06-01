return {
	enabled = true,
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<A-l>",
					clear_suggestion = "<A-x>",
					accept_word = "<A-w>",
				},
				ignore_filetypes = {},
				color = {
					suggestion_color = "#808080",
					cterm = 244,
				},
				disable_inline_completion = true, -- disables inline completion for use with cmp
				disable_keymaps = true, -- disables built in keymaps for more manual control
			}),
			require("cmp").setup({
				sources = {
					{ name = "nvim_lsp", priority = 10000000000 },
                    { name = "supermaven", priority = -10000000000 },
				},
			}),
		})
	end,
}
