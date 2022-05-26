require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'fish',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'prisma',
    'python',
    'typescript',
    'vim',
    'yaml',
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enabled = true,
  },
})
