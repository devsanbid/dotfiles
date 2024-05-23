return {
  'cbochs/grapple.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local grapple = require 'grapple'
    grapple.setup {
      icons = false,
    }
    -- REQUIRED
    vim.keymap.set('n', '<leader>ha', function()
      grapple.tag()
    end)
    vim.keymap.set('n', '<leader>hm', ':Grapple open_tags<cr>')
    vim.keymap.set('n', '<leader>hX', function()
      require('grapple').reset()
    end)
    vim.keymap.set('n', '<leader>hx', function()
      require('grapple').untag()
    end)
    local opts = { silent = true }

    vim.keymap.set('n', '<leader>h1', ':Grapple select index=1<cr>', opts)
    vim.keymap.set('n', '<leader>h2', ':Grapple select index=2<cr>', opts)
    vim.keymap.set('n', '<leader>h3', ':Grapple select index=3<cr>', opts)
    vim.keymap.set('n', '<leader>h4', ':Grapple select index=4<cr>', opts)
    vim.keymap.set('n', '<leader>h5', ':Grapple select index=5<cr>', opts)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<Left>', function()
      grapple.cycle_backward()
    end)
    vim.keymap.set('n', '<Right>', function()
      grapple.cycle_forward()
    end)
  end,
}

