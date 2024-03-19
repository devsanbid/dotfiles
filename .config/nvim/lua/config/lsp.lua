-- Use lsp_zero to manage lsp attachments.
local lsp_zero = require 'lsp-zero'
lsp_zero.extend_lspconfig()
local lspconfig = require 'lspconfig'

lspconfig.tsserver.setup {
  settings = {
    documentformatting = false,
    diagnostics = {
      enable = false,
    },
  },
}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {
          'vim',
          'describe',
          'it',
          'before_each',
          'after_each',
          'teardown',
          'pending',
        },
      },
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = {
          '${3rd}/luv/library',
          unpack(vim.api.nvim_get_runtime_file('', true)),
        },
      },
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
}
vim.diagnostic.config {
  underline = true,
  virtual_text = {
    spacing = 4,
    source = 'if_many',
    prefix = '●',
    update_in_insert = true,
  },
  severity_sort = true,
}

lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
        disabled = { 'unresolved-proc-macro' },
        enableExperimental = true,
      },
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        runBuildScripts = true,
      },
      -- Add clippy lints for Rust
      checkOnSave = {
        enable = false,
        allFeatures = false,
        command = 'clippy',
        extraArgs = { '--no-deps' },
      },
      procMacro = {
        enable = true,
        ignored = {
          ['async-trait'] = { 'async_trait' },
          ['napi-derive'] = { 'napi' },
          ['async-recursion'] = { 'async_recursion' },
        },
      },
    },
  },
}

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps { buffer = bufnr }
end)

-- Setup Mason and Mason-Config.
require('mason').setup {}
require('mason-lspconfig').setup {
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
}

--cmp
-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
  return
end

local cmp_ultisnips_mappings = require 'cmp_nvim_ultisnips.mappings'
-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, 'luasnip')
if not luasnip_status then
  return
end

luasnip.filetype_extend('typescriptreact', { 'html' })
require('luasnip/loaders/from_vscode').lazy_load()

vim.opt.completeopt = 'menu,menuone,noinsert'

-- Add parentheses after selecting function or method item
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- disable cmp in comment
cmp.setup {
  enabled = function()
    -- disable completion in comments
    local context = require 'cmp.config.context'
    buftype = vim.api.nvim_buf_get_option(0, 'buftype')
    if buftype == 'prompt' or buftype == 'acwrite' then
      return false
    end
    -- keep command mode completion disable when cursor is in a comment
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture 'comment' and not context.in_syntax_group 'Comment'
    end
  end,
}

cmp.setup {
  formatting = {
    fields = { 'abbr', 'kind' },
    format = function(_, vim_item)
      vim_item.menu = ''
      --vim_item.kind = ""
      --vim_item.abbr = ""
      return vim_item
    end,
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,                    -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
    ['<CR>'] = cmp.mapping.confirm { select = false }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.compose { 'select_next_item', 'jump_forwards' } (fallback)
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.compose { 'select_prev_item', 'jump_backwards' } (fallback)
    end, { 'i', 's' }),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's', 'c' }),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's', 'c' }),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp',  priority = 1000 }, -- LSP
    { name = 'nvim_lua' },
    { name = 'cmp-tw2css' },
    { name = 'neorg' },
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' },
    { name = 'buffer' }, -- text within the current buffer
    { name = 'fish' },
    { name = 'path' },   -- file system paths
    {
      name = 'env',
      -- Defaults
      option = {
        path = '.',
        load_shell = false,
        item_kind = cmp.lsp.CompletionItemKind.Variable,
        eval_on_confirm = false,
        show_documentation = false,
        show_content_on_docs = false,
        documentation_kind = 'markdown',
        dotenv_environment = '.en*',
        file_priority = function(a, b)
          -- Prioritizing local files
          return a:upper() < b:upper()
        end,
      },
    },
  },
}

require('cmp').setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
  sources = {
    { name = 'dap' },
  },
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' },
      },
    },
  }),
})
