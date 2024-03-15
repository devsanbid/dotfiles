return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    default_component_configs = {
      git_status = {
        symbols = false,
      },
      modified = false,
      name = false,
    },

    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignored = false,
        hide_hidden = true,
        hide_by_name = {
          "output_c",
          "node_modules",
        },
        hide_by_pattern = {},

        always_show = { -- remains visible even if other settings would normally hide it
          ".gitignored",
          ".env",
          ".env.local",
        },
      },
    },
  },
}
