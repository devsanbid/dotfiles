return {
  n = {

    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },

    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>R"] = { ":AstroReload<cr>", desc = "Reload AstroNvim" },
    ["<leader>e"] = { ":Neotree toggle reveal_force_cwd<cr>", desc = "neotree" },
    ["<leader><leader>"] = { ":Telescope find_files<cr>", desc = "find files" },
    ["<leader>lm"] = { ":Mason <cr> ", desc = "lsp Installer" },
    ["<leader>fr"] = { ":Telescope oldfiles <cr> ", desc = "Recent files" },

    ["<A-j>"] = { "8j" },
    ["<A-k>"] = { "8k" },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
  },
  t = {},
}
