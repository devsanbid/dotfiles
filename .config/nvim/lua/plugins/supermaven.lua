return {
	enabled = true,
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			ignore_filetypes = {},
			color = {
				suggestion_color = "#808080",
				cterm = 244,
			},
			disable_inline_completion = true, -- disables inline completion for use with cmp
			disable_keymaps = true, -- disables built in keymaps for more manual control
		})
		local completion_preview = require("supermaven-nvim.completion_preview")
		vim.keymap.set("i", "<c-l>", completion_preview.on_accept_suggestion, { noremap = true, silent = true })

		require("cmp").setup({
			sources = {
				{ name = "nvim_lsp", priority = 10000000000 },
				{ name = "supermaven", priority = -10000000000 },
			},
		})
	end,
}
