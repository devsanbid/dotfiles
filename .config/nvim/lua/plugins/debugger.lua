return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'leoluz/nvim-dap-go',
    'rcarriga/nvim-dap-ui',
    { 'mxsdev/nvim-dap-vscode-js' },
    {
      "microsoft/vscode-js-debug",
      lazy = true,
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }
  },
  config = function()
    require('dapui').setup()
    require('dap-go').setup()

    require('dap-vscode-js').setup {
      debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
      adapters = { 'pwa-chrome', 'pwa-node' },
    }

    local js_based_languages = { 'typescript', 'javascript', 'typescriptreact' }

    for _, language in ipairs(js_based_languages) do
      require('dap').configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-chrome',
          request = 'launch',
          name = 'Start Chrome with "localhost"',
          url = 'http://localhost:3000',
          webRoot = '${workspaceFolder}',
          userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
        },
      }
    end

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
  end,
}
