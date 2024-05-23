return {

  "mfussenegger/nvim-dap",

  dependencies = {

    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    'theHamsta/nvim-dap-virtual-text',
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",

    "leoluz/nvim-dap-go"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    require("nvim-dap-virtual-text").setup()

    require("mason-nvim-dap").setup({

      automatic_installation = true,

      handlers = {},
      ensure_installed = { "python", "delve", "js", "firefox", "bash", "stylua", "node2" },
    })

    vim.keymap.set("n", "<Leader>da", ":DapToggleBreakpoint<CR>")
    vim.keymap.set("n", "<leader>du", require("dapui").toggle)
    vim.keymap.set("n", "<Leader>ds", ":DapContinue<CR>")
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
    vim.keymap.set("n", "<Leader>dn", ":DapStepOver<CR>")
    vim.keymap.set("n", "<Leader>do", ":DapStepOut<CR>")
    vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>")
    vim.keymap.set({ "n", "v" }, "<M-s>", require("dapui").eval)

    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    require("dap-go").setup({
      delve = {
        detached = vim.fn.has("win32") == 0,
      },
    })
  end,
}
