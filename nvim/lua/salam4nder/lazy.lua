local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'github/copilot.vim',
  'tpope/vim-commentary',
  'lewis6991/gitsigns.nvim',
  'karb94/neoscroll.nvim',
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  'nvim-lualine/lualine.nvim',
  
  -- LSP
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  "L3MON4D3/LuaSnip",

-- Themes
  'maxmx03/solarized.nvim',
  
  'folke/trouble.nvim',
  'crispgm/nvim-go',
  'airblade/vim-rooter',
  'nvim-treesitter/nvim-treesitter',
  {
    "folke/noice.nvim",
     event = "VeryLazy",
     opts = {},
      dependencies = {
        "MunifTanjim/nui.nvim",
        }
  },
})
