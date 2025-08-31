local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'tpope/vim-commentary',
  'lewis6991/gitsigns.nvim',
  'karb94/neoscroll.nvim',
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  'folke/trouble.nvim',
  'crispgm/nvim-go',
  'airblade/vim-rooter',
  'nvim-lualine/lualine.nvim',
   {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
   },
   {
       'akinsho/toggleterm.nvim', config = function()
        require("toggleterm").setup()
    end
   },
  
  -- LSP
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp-signature-help',

-- Themes
      'lifepillar/vim-gruvbox8',
     {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.gruvbox_material_enable_italic = false
        vim.g.gruvbox_material_enable_bold = false
        vim.g.gruvbox_material_background = 'hard'
        vim.cmd.colorscheme('gruvbox-material')
      end
    },
})
