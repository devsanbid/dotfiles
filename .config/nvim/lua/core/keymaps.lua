local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '

--remove keymap default i hate that
keymap('v', '<S-j>', '<Nop>')
keymap('n', '<S-j>', '<Nop>')
keymap('n', "U", "g+")

-- navigation change for 1 month to use only escape
-- keymap('i', 'jk', '<ESC>')
-- keymap('i', 'JK', '<ESC>')
-- keymap('i', 'kj', '<ESC>')
-- keymap('i', 'jj', '<ESC>')
-- keymap('i', 'Jk', '<ESC>')
-- keymap('i', 'Jk', '<ESC>')
--
keymap('n', '<leader>jm', ':NodeAction<cr>')
keymap('n', '<leader>jj', ':TSJToggle<cr>')

keymap('n', '<C-z>', '<cmd>cnext<CR>zz')
keymap('n', '<C-S-z>', '<cmd>cprev<CR>zz')
keymap('n', 'zz', '<cmd>QuickFix<CR>')

-- keymap trouble
keymap('n', '<leader>tt', function()
  require('trouble').toggle()
end)

keymap('n', '<leader>td', ':Trouble document_diagnostics<cr>')
keymap('n', '<leader>tq', ':Trouble quickfix<cr>')

keymap('n', '<leader>tn', function()
  require('trouble').next { skip_groups = true, jump = true }
end)
keymap('n', '<leader>tp', function()
  require('trouble').previous { skip_groups = true, jump = true }
end)

-- select all


-- split buffer
keymap("n", "ss", ":split<Return>")
keymap("n", "sv", ":vsplit<Return><C-w>w")


keymap({ 'n', 'x' }, 'j', 'gj', opts)
keymap({ 'n', 'x' }, 'k', 'gk', opts)


vim.keymap.set("n", "<C-n>", ":keepjumps normal! mi*`i<CR>") -- " Use * to add w/out jumping
vim.keymap.set('n', 'gx', ":silent! execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>")


-- take screenshot
keymap({ 'n', 'v' }, '<leader>ss', ':Silicon<cr>')

-- buffer
keymap('n', '<leader>c', ':bdelete<cr>', opts)

-- file action
keymap('n', '<leader>w', ':w<cr>', opts)
keymap('n', '<leader>q', ':q!<cr>', opts)

-- up and down
keymap('n', '<M-S-j>', '8jzz')
keymap('n', '<M-S-k>', '8kzz')


-- center while searching
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')

keymap('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

--telescope
keymap('n', '<leader>ff', ':Telescope find_files<cr>', opts)
-- keymap("n", "<leader><leader>", ":Telescope find_files<cr>", opts)
keymap('n', '<leader>fw', ':Telescope live_grep<cr>', opts)
keymap('n', '<leader>fH', ':Telescope help_tags<cr>', opts)
keymap('n', '<leader>fr', ':Telescope oldfiles<cr>', opts)
keymap('n', '<leader>fh', ':Telescope highlights<cr>', opts)
keymap('n', '<leader>fp', ':Telescope yank_history<cr>')


keymap('n', '<leader>lf', function()
  vim.lsp.buf.format()
end, opts)
keymap('n', '<leader>lr', function()
  vim.lsp.buf.rename()
end, opts)
keymap('n', '<leader>la', function()
  vim.lsp.buf.code_action()
end, opts)
keymap('n', '<leader>li', ':LspInfo<cr>', opts)
keymap('n', '<leader>lI', ':LspInstall<cr>', opts)
keymap('n', '<leader>lm', ':Mason<cr>', opts)


--explore
-- keymap("n", "<leader>e", ":Neotree toggle reveal_force_cwd<cr>", opts)

vim.keymap.set('n', '<leader>e', function()
  if vim.bo.filetype == 'oil' then
    require('oil').close()
  else
    require('oil').open()
  end
end, opts)

--edit files
keymap('n', '<leader>sm', ':e ~/.config/nvim/lua/core/init.lua<cr>', opts)
keymap('n', '<leader>sk', ':e ~/.config/nvim/lua/core/keymaps.lua<cr>', opts)
keymap('n', '<leader>so', ':e ~/.config/nvim/lua/core/options.lua<cr>', opts)
keymap('n', '<leader>sa', ':e ~/.config/nvim/lua/core/autocmds.lua<cr>', opts)
keymap('n', '<leader>sh', ':e ~/.config/nvim/lua/core/highlight.lua<cr>', opts)
keymap('n', '<leader>sp', ':e ~/.config/nvim/lua/plugins/init.lua<cr>', opts)
keymap('n', '<leader>sc', ':e ~/.config/nvim/lua/core/commands.lua<cr>', opts)

vim.cmd 'vnoremap im aBoV'
vim.cmd 'nnoremap "" vi"'
vim.cmd 'vnoremap am aBjoV'
