vim.opt.termguicolors = true
require('bufferline').setup({
  options = {
    mode = 'tabs',
    diagnostics = 'nvim_lsp',
  },
})
