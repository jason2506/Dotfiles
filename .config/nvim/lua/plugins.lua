local function setup_packer (use)
  -- Package manager
  use({ 'wbthomason/packer.nvim' })

  -- Last Cursor Position
  use({ 'farmergreg/vim-lastplace' })

  -- User Interface
  use({ 'airblade/vim-gitgutter' })
  use({
    'folke/tokyonight.nvim',
    config = [[ require('config.tokyonight') ]],
  })
  use({
    'nvim-lualine/lualine.nvim',
    config = [[ require('config.lualine') ]],
  })

  -- Syntax Parsing
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = {
      'CursorHold',
      'CursorMoved',
      'BufNewFile',
      'BufRead',
      'InsertEnter',
    },
    config = [[ require('config.treesitter') ]],
  })
  use({
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
    config = function ()
      require('treesitter-context').setup()
    end,
  })

  -- Completion & Linting
  use({
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter' },
    requires = {
      -- sources
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      -- snippets
      { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
      { 'hrsh7th/vim-vsnip' },
    },
    config = [[ require('config.cmp') ]],
  })

  use({
    'neovim/nvim-lspconfig',
    after = 'cmp-nvim-lsp',
    requires = {
      'williamboman/nvim-lsp-installer',
      'j-hui/fidget.nvim',
      'ray-x/lsp_signature.nvim',
      'kosayoda/nvim-lightbulb',
    },
    config = [[ require('config.lsp') ]],
  })

  -- Auto Pairs
  use({
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = [[ require('config.autopairs') ]],
  })

  -- Jump
  use {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = [[ require('config.hop') ]],
  }
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = [[ require('config.telescope') ]],
  })
end

-- Auto install packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path,
  })
end

require('packer').startup(setup_packer)
