return {
 'nvim-treesitter/nvim-treesitter',
 build = ":TSUpdate",
 event = { "BufReadPre", "BufNewFile" },
 dependencies = {
  "nvim-treesitter/nvim-treesitter-textobjects",
 },
 config = function()
  require 'nvim-treesitter.configs'.setup {
   ensure_installed = {
    'tsx',
    'javascript',
    'typescript',
    'fish',
    'markdown',
    'bash',
    'norg',
    'css',
    'json',
    'jsonc',
    'vim',
    'vimdoc',
    'yaml',
    "gitignore",
    "markdown_inline",
    'query',
    'regex',
    'toml',
    'rasi',
    'luadoc',
    'jsdoc',
    'html',
    'prisma',
    'lua',
    'dockerfile',
   },

   sync_install = false,

   auto_install = true,

   highlight = {
    enable = true,
    disable = function(_, buf)
     local max_filesize = 2000 * 1024 -- 2 mb
     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
     if ok and stats and stats.size > max_filesize then
      return true
     end
    end,
    additional_vim_regex_highlighting = false,
   },

   indent = { enable = true },
   incremental_selection = {
    enable = true,
    keymaps = {
     init_selection = "<c-b>",
     node_incremental = "<c-b>",
     scope_incremental = false,
     node_decremental = "<bs>",
    },
   },
  }
 end
}
