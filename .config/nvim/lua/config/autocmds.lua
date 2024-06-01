local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
	return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

vim.filetype.add({
	extension = {
		png = "png",
		jpeg = "jpeg",
		jpg = "jpg",
		webp = "webp",
	},
})


-- make a autccmd for python to run specific keymap
autocmd("FileType", {
    group = augroup("python"),
    pattern = "python",
    callback = function(args)
        vim.keymap.set("n", "<leader>;", "mmA:<ESC>`m", { silent = true })
    end,
})


autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	group = augroup("misc"),
	pattern = "*",
	command = 'silent! normal! g`"zv',
})
