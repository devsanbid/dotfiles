local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
  callback = function()
    if vim.g.inlay_hint_enable then
      vim.lsp.inlay_hint.enable()
      vim.cmd("hi LspInlayHint guibg=none")
    end
  end,
})

autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
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

autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

autocmd({ "BufWritePre" }, {
  group = augroup("auto_delete_trailing_white_space"),
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

local id = vim.api.nvim_create_augroup("startup", {
  clear = false,
})

local persistbuffer = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  vim.fn.setbufvar(bufnr, "bufpersist", 1)
end

autocmd({ "BufRead" }, {
  group = id,
  pattern = { "*" },
  callback = function()
    autocmd({ "InsertEnter", "BufModifiedSet" }, {
      buffer = 0,
      once = true,
      callback = function()
        persistbuffer()
      end,
    })
  end,
})

autocmd("BufReadPost", {
  desc = "Open file at the last position it was edited earlier",
  group = augroup("misc"),
  pattern = "*",
  command = 'silent! normal! g`"zv',
})

autocmd("InsertLeave", {
  group = augroup("auto_format_line_python"),
  pattern = "*.py",
  callback = function()
    -- vim.cmd("retab")
    vim.cmd("normal! ==")
  end,
})

local hi = vim.api.nvim_set_hl
hi(0, "ColorColumn", { bg = "gray" })
hi(0, "Visual", { bg = "#1e1e2e" })
hi(0, "Pmenu", { bg = "#1e1e2e" })
hi(0, "MatchParen", { bg = "none", fg = "green" })

hi(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
-- blue
hi(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
hi(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
-- light blue
hi(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
hi(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
hi(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
-- pink
hi(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
hi(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
-- front
hi(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
hi(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
hi(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })
hi(0, "ColorColumn", { bg = "gray" })
hi(0, "LspInlayHint", { bg = "none" })
