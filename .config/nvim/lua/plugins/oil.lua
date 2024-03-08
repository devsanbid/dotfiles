return {
  "stevearc/oil.nvim",
  opts = {
    columns = {
      { "icon", nil },
    },
    prompt_save_on_select_new_entry = true,
    win_options = {
      wrap = false,
      signcolumn = "no",
      cursorcolumn = false,
      cursorline = true,
      foldcolumn = "0",
      spell = false,
      list = false,
      number = false,
      relativenumber = false,
      conceallevel = 3,
      concealcursor = "nvic",
    },
    float = {
      -- Padding around the floating window
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
      { "size", "desc" },
      { "name", "asc" },
    },

    lsp_file_methods = { autosave_changes = true },
    experimental_watch_for_changes = true,
    keymaps = {
      ["g?"] = "actions.show_help",
      ["L"] = "actions.select",
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-h>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
      ["H"] = "actions.parent",
      ["."] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = false,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, ".")
      end,
      -- This function defines what will never be shown, even when `show_hidden` is set
      is_always_hidden = function(name, bufnr)
        return vim.startswith(name, "node_modules")
      end,
      sort = {
        -- sort order can be "asc" or "desc"
        -- see :help oil-columns to see which columns are sortable
        { "type", "asc" },
        { "name", "asc" },
      },
    },
  },
}
