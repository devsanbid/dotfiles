local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.maplocalleader = " "

keymap("v", "<S-j>", "<Nop>")
keymap("n", "<S-j>", "<Nop>")
keymap("n", "U", "g+")

keymap("n", "<leader>uc", function()
  local current_value = vim.g.cmp_disable
  if current_value then
    vim.g.cmp_disable = false
  else
    vim.g.cmp_disable = true
  end
end)

keymap("n", "p", "p=`]", { silent = true })
keymap("v", "y", "ygv<esc>")

keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)

vim.keymap.set("n", "<C-n>", ":keepjumps normal! mi*`i<CR>") -- " Use * to add w/out jumping
vim.keymap.set("n", "gx", ":silent! execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>")

-- buffer
keymap("n", "<leader>c", ":bdelete<cr>", opts)

-- file action
keymap("n", "<leader>w", ":w<cr>", opts)
keymap("n", "<leader>q", ":q!<cr>", opts)

-- up and down
keymap("n", "<M-S-j>", "8jzz")
keymap("n", "<M-S-k>", "8kzz")

-- center while searching
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

--telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader><leader>", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fw", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fH", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fh", ":Telescope highlights<cr>", opts)
keymap("n", "<leader>fp", ":Telescope yank_history<cr>")

keymap("n", "<leader>lf", function()
  vim.lsp.buf.format()
end, opts)
keymap("n", "<leader>lr", function()
  vim.lsp.buf.rename()
end, opts)
keymap("n", "<leader>la", function()
  vim.lsp.buf.code_action()
end, opts)
keymap("n", "<leader>li", ":LspInfo<cr>", opts)
keymap("n", "<leader>lI", ":LspInstall<cr>", opts)
keymap("n", "<leader>lm", ":Mason<cr>", opts)

vim.keymap.set("n", "<leader>e", function()
  if vim.bo.filetype == "oil" then
    require("oil").close()
  else
    require("oil").open()
  end
end, opts)

vim.cmd("vnoremap im aBoV")
vim.cmd('nnoremap "" vi"')
vim.cmd("vnoremap am aBjoV")
