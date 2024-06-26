local opt = vim.opt
local global = vim.g
vim.g.mapleader = " "
global.maplocalleader = ' '
opt.guicursor = ''
vim.g.completion_abbr_length = 10 -- completion item (left)
vim.g.completion_menu_length = 10 -- extra info for completion item (right)

vim.g.cmp_disable = false
vim.g.inlay_hint_enable = false
opt.nu = true
opt.grepprg = "rg --vimgrep" -- Program to use for grep
opt.relativenumber = true
opt.spelllang = { -- Languages for spell checking
	"en",
}

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartcase = true
opt.ignorecase = true
opt.showtabline = 0
opt.linebreak = true
opt.smartindent = true
opt.wrap = false
opt.showmode = false
opt.cursorline = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.undofile = true
opt.undolevels = 10000
opt.virtualedit = 'block'
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
vim.opt.clipboard:append 'unnamedplus' -- use system clipboard
opt.scrolloff = 16
opt.signcolumn = 'no'
opt.isfname:append '@-@'
opt.pumheight = 8
opt.pumwidth = 5
opt.mouse = ''
opt.autowrite = true -- Enable auto write
opt.formatoptions = 'jcroqlnt' -- tcqj
opt.grepprg = 'rg --vimgrep'
opt.pumblend = 10 -- Popup blend
opt.showmode = false
opt.sidescrolloff = 8 -- Columns of context
-- opt.updatetime = 50
opt.colorcolumn = '80'

