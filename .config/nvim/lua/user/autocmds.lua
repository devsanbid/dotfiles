vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  group = vim.api.nvim_create_augroup("Color", {}),
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "none" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "none" })
    vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "none" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
  end,
})
