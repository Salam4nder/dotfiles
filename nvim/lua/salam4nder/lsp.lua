vim.g.completeopt="menu,menuone,noselect,noinsert"

local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

local lsp_flags = {
  debounce_text_changes = 150,
}

-- vim.lsp.enable('clangd')

local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  init_options = {
    -- fallbackFlags = { '-std=c++17' },
  },
})

lspconfig.rust_analyzer.setup({
    cmd = { 'rust-analyzer' },

    filetypes = {'rust', 'rs'},

    root_markers = { 'Cargo.toml', 'Cargo.lock' },

    settings = {
     ['rust-analyzer'] = {
       diagnostics = {
         enable = true;
       }
     }
  }
})

-- vim.lsp.enable('rust_analyzer')
-- vim.lsp.config['rust_analyzer'] = {
--     cmd = { 'rust_analyzer' },

--     filetypes = {'rust', 'rs'},

--     root_markers = { 'Cargo.toml', 'Cargo.lock' },

--     settings = {
--      ['rust-analyzer'] = {
--        diagnostics = {
--          enable = true;
--        }
--      }
--   }
-- }

vim.lsp.enable('gopls')
vim.lsp.config['gopls'] = {
    cmd = { 'gopls' },

    filetypes = { "go", "gomod", "gowork", "gotmpl" },

    root_markers = { 'go.mod' },

    settings = {
        ['gopls'] = {
          gofumpt = true,
          buildFlags =  {"-tags=integration", "-tags=test", "-tags=testdb"},
          completeUnimported = true,
          analyses = {
            unusedparams = true,
          },
        },
    },
}

local cmp = require'cmp'

cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
    }), 
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline', keyword_length = 3 }
    })
  })
