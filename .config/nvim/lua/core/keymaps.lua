local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

--remove keymap default i hate that
keymap("v", "<S-j>", "<Nop>")

-- navigation
keymap("i", "jk", "<ESC>")
keymap("i", "JK", "<ESC>")
keymap("i", "kj", "<ESC>")
keymap("i", "jj", "<ESC>")
keymap("i", "Jk", "<ESC>")

keymap("n", "<leader>jm", ":NodeAction<cr>")
keymap("n", "<leader>jj", ":TSJToggle<cr>")
keymap("x", "p", [["_dP]])

keymap("n", "<C-z>", "<cmd>cnext<CR>zz")
keymap("n", "<C-S-z>", "<cmd>cprev<CR>zz")
keymap("n", "zz", "<cmd>QuickFix<CR>")

-- keymap trouble
keymap("n", "<leader>tt", function()
  require("trouble").toggle()
end)

keymap("n", "<leader>td", ":Trouble document_diagnostics<cr>")
keymap("n", "<leader>tq", ":Trouble quickfix<cr>")

keymap("n", "<leader>tn", function()
  require("trouble").next({ skip_groups = true, jump = true })
end)
keymap("n", "<leader>tp", function()
  require("trouble").previous({ skip_groups = true, jump = true })
end)

keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)

keymap("n", "*", "*zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#z", opts)

-- take screenshot
keymap({ "n", "v" }, "<leader>ss", ":Silicon<cr>")

-- buffer
keymap("n", "<leader>c", ":bdelete<cr>", opts)

-- file action
keymap("n", "<leader>w", ":w<cr>", opts)
keymap("n", "<leader>q", ":q!<cr>", opts)

-- up and down
keymap("n", "<M-S-j>", "<C-d>zz")
keymap("n", "<M-S-k>", "<C-u>zz")

keymap("n", "<Up>", "8k", opts)
keymap("n", "<Down>", "8j", opts)

-- center while searching
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

--telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader><leader>", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fw", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fH", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fh", ":Telescope highlights<cr>", opts)

keymap("n", "<leader>ac", function()
  vim.ui.input({ prompt = "Enter your commit message" }, function(input)
    vim.cmd("Git add .")
    local commit_message = "Git commit -m '" .. input .. "' ."
    vim.cmd(commit_message)
    print("Done commit")
  end)
end)

keymap("n", "<leader>ap", function()
  print("pushing.....")
  vim.cmd.Git("push")
end)

keymap("n", "<leader>aP", function()
  print("pulling.....")
  vim.cmd.Git("pull")
end)

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

--explore
-- keymap("n", "<leader>e", ":Neotree toggle reveal_force_cwd<cr>", opts)

keymap("n", "<leader>e", ":Oil<cr>", opts)

--edit files
keymap("n", "<leader>sm", ":e ~/.config/nv/lua/core/init.lua<cr>", opts)
keymap("n", "<leader>sk", ":e ~/.config/nv/lua/core/keymaps.lua<cr>", opts)
keymap("n", "<leader>so", ":e ~/.config/nv/lua/core/options.lua<cr>", opts)
keymap("n", "<leader>sa", ":e ~/.config/nv/lua/core/autocmds.lua<cr>", opts)
keymap("n", "<leader>sh", ":e ~/.config/nv/lua/core/highlight.lua<cr>", opts)
keymap("n", "<leader>sp", ":e ~/.config/nv/lua/plugins/init.lua<cr>", opts)
keymap("n", "<leader>sc", ":e ~/.config/nv/lua/core/commands.lua<cr>", opts)

vim.cmd("vnoremap im aBoV")
vim.cmd('nnoremap "" vi"')
vim.cmd("vnoremap am aBjoV")
