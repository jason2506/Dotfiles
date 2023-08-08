local plugins = {
  -- Last Cursor Position
  { 'farmergreg/vim-lastplace' },

  -- User Interface
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.gitsigns')
    end,
  },
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd('colorscheme tokyonight')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end,
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
      },
    },
    init = function()
      vim.opt.termguicolors = true
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      show_current_context = true,
    },
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('plugins.notify')
    end,
  },

  -- Syntax Parsing
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end,
  },
  { 'nvim-treesitter/nvim-treesitter-context' },

  -- Completion & Linting
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- sources
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-emoji' },
      -- snippets
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      require('plugins.cmp')
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy' },
      'ray-x/lsp_signature.nvim',
      'b0o/schemastore.nvim',
      {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
      },
    },
    config = function()
      require('plugins.lsp')
    end,
  },

  -- Auto Pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true,
    },
  },

  -- Terminal Integration
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('plugins.toggleterm')
    end,
  },

  -- Jump
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require('plugins.telescope')
    end,
  },
}

-- Auto install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(plugins)
