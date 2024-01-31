vim.g.completeopt="menu,menuone,noselect,noinsert"

local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) 
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer'},
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline', keyword_length = 3 }
    })
  })

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

local lsp_flags = {
  debounce_text_changes = 150,
}

require'lspconfig'.gopls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
    gopls = {
      gofumpt = true,
      buildFlags =  {"-tags=integration", "-tags=test", "-tags=testdb"},
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
    }
  },
}

require'lspconfig'.rust_analyzer.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}

require'lspconfig'.html.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}

require'lspconfig'.cssls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
