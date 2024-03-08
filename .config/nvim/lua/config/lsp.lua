-- Use lsp_zero to manage lsp attachments.
local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()
local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
  settings = {
    documentformatting = false,
    diagnostics = {
      enable = false,
    },
  },
})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = {
          "${3rd}/luv/library",
          unpack(vim.api.nvim_get_runtime_file("", true)),
        },
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})
vim.diagnostic.config({
  underline = true,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  severity_sort = true,
})

lspconfig.rust_analyzer.setup({
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
        disabled = { "unresolved-proc-macro" },
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
        command = "clippy",
        extraArgs = { "--no-deps" },
      },
      procMacro = {
        enable = true,
        ignored = {
          ["async-trait"] = { "async_trait" },
          ["napi-derive"] = { "napi" },
          ["async-recursion"] = { "async_recursion" },
        },
      },
    },
  },
})

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- Setup Mason and Mason-Config.
require("mason").setup({})
require("mason-lspconfig").setup({
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  },
})

--cmp
-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

luasnip.filetype_extend("typescriptreact", { "html" })
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noinsert"

-- Add parentheses after selecting function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- disable cmp in comment
cmp.setup({
  enabled = function()
    -- disable completion in comments
    local context = require("cmp.config.context")
    buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype == "prompt" or buftype == "acwrite" then
      return false
    end
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
    end
  end,
})

cmp.setup({
  formatting = {
    fields = { "abbr", "kind" },
    format = function(_, vim_item)
      vim_item.menu = ""
      --vim_item.kind = ""
      --vim_item.abbr = ""
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        -- You could replace select_next_item() with
        -- confirm({ select = true }) to get VS Code autocompletion behavior
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls
        -- with expand_or_locally_jumpable()
        -- this way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp", priority = 1000 }, -- LSP
    { name = "luasnip" },                 -- snippets
    --  { name = 'ultisnips' },                 -- For ultisnips users.
    { name = "buffer" },                  -- text within the current buffer
    { name = "path" },                    -- file system paths
  }),
})
