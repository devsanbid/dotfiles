return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  ft = 'norg',
  cmd = 'Neorg',
  lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
  -- tag = "*",
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter', 'nvim-treesitter/nvim-treesitter-textobjects', 'nvim-cmp', '3rd/image.nvim' },
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.autocommands'] = {},
        ['core.syntax'] = {},
        ['core.ui'] = {},
        ['core.keybinds'] = {
          config = {
            default_keybinds = true,
            neorg_leader = ";"
          },
        },
        ['core.looking-glass'] = {},
        ['core.esupports.metagen'] = { config = { type = 'auto', update_date = true } },
        ['core.qol.todo_items'] = {},
        ['core.highlights'] = {},
        ['core.integrations.treesitter'] = {},
        ['core.completion'] = { config = { engine = 'nvim-cmp', name = '[Norg]' } },
        ['core.integrations.nvim-cmp'] = {},
        ['core.concealer'] = { config = { icon_preset = 'varied' } },
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              work = '~/notes/work',
              personal = '~/notes/personal',
              document = '~/notes/document',
            },
          },
        },
      },
    }
  end,
}
