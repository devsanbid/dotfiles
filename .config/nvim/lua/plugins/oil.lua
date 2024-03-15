return {
  'stevearc/oil.nvim',
  opts = {
    prompt_save_on_select_new_entry = true,
    win_options = {
      wrap = false,
      signcolumn = 'no',
      cursorcolumn = false,
      cursorline = true,
      foldcolumn = '0',
      spell = false,
      list = false,
      number = false,
      relativenumber = false,
      conceallevel = 3,
      concealcursor = 'nvic',
    },
    float = {
      padding = 2,
      max_width = 40,
      max_height = 0,
      win_options = {
        winblend = 0,
      },
      override = function(conf)
        return conf
      end,
    },
    skip_confirm_for_simple_edits = true,
    sort = {
      { 'size', 'desc' },
      { 'name', 'asc' },
    },
    lsp_file_methods = { autosave_changes = true },
    experimental_watch_for_changes = true,
    keymaps = {
      ['g?'] = 'actions.show_help',
      ['L'] = 'actions.select',
      ['<C-s>'] = 'actions.select_vsplit',
      ['<C-h>'] = 'actions.select_split',
      ['<C-t>'] = 'actions.select_tab',
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = 'actions.close',
      ['<C-r>'] = 'actions.refresh',
      ['H'] = 'actions.parent',
      ['.'] = 'actions.open_cwd',
      ['`'] = 'actions.cd',
      ['~'] = 'actions.tcd',
      ['gs'] = 'actions.change_sort',
      ['gx'] = 'actions.open_external',
      ['g.'] = 'actions.toggle_hidden',
      ['g\\'] = 'actions.toggle_trash',
    },
    view_options = {
      show_hidden = false,
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, '.')
      end,
      is_always_hidden = function(name, bufnr)
        return vim.startswith(name, 'node_modules')
      end,
      sort = {
        { 'type', 'asc' },
        { 'name', 'asc' },
      },
    },
  },
}
