return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    require('dapui').setup()
    require('mason-nvim-dap').setup {
      ensure_installed = { 'python', 'delve', 'js', 'firefox', 'bash', 'stylua', 'node2' },
      automatic_installation = true,
      handlers = {}, -- sets up dap in the predefined manner
    }

    local dap, dapui = require 'dap', require 'dapui'

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<Leader>da', ':DapToggleBreakpoint<CR>')
    vim.keymap.set('n', '<leader>du', require('dapui').toggle)
    vim.keymap.set('n', '<Leader>ds', ':DapContinue<CR>')
    vim.keymap.set('n', '<Leader>dx', ':DapTerminate<CR>')
    vim.keymap.set('n', '<Leader>dn', ':DapStepOver<CR>')
    vim.keymap.set('n', '<Leader>do', ':DapStepOut<CR>')
    vim.keymap.set('n', '<Leader>di', ':DapStepInto<CR>')
    vim.keymap.set({ 'n', 'v' }, '<M-K>', require('dapui').eval)
  end,
}
