local function setup_packer(use)
  -- Package manager
  use({ 'wbthomason/packer.nvim' })

  -- Last Cursor Position
  use({ 'farmergreg/vim-lastplace' })

  -- User Interface
  use({
    'lewis6991/gitsigns.nvim',
    config = [[ require('plugins.gitsigns') ]],
  })
  use({
    'folke/tokyonight.nvim',
    config = [[ require('plugins.tokyonight') ]],
  })
  use({
    'nvim-lualine/lualine.nvim',
    config = [[ require('plugins.lualine') ]],
  })
  use({
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = [[ require('plugins.bufferline') ]],
  })
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = [[ require('plugins.indent-blankline') ]],
  })
  use({
    'rcarriga/nvim-notify',
    config = [[ require('plugins.notify') ]],
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
    config = [[ require('plugins.treesitter') ]],
  })
  use({
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
    config = function()
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
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' },
      -- snippets
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = [[ require('plugins.cmp') ]],
  })
  use({
    'neovim/nvim-lspconfig',
    after = 'cmp-nvim-lsp',
    requires = {
      'williamboman/nvim-lsp-installer',
      'j-hui/fidget.nvim',
      'ray-x/lsp_signature.nvim',
      'b0o/schemastore.nvim',
    },
    config = [[ require('plugins.lsp') ]],
  })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = [[ require('plugins.null-ls') ]],
  })

  -- Auto Pairs
  use({
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = [[ require('plugins.autopairs') ]],
  })

  -- Terminal Integration
  use({
    'akinsho/toggleterm.nvim',
    tag = 'v1.*',
    config = [[ require('plugins.toggleterm') ]],
  })

  -- Jump
  use({
    'phaazon/hop.nvim',
    branch = 'v1',
    config = [[ require('plugins.hop') ]],
  })
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = [[ require('plugins.telescope') ]],
  })
end

-- Auto install packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
end

require('packer').startup(setup_packer)
