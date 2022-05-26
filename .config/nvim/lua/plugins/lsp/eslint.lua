vim.api.nvim_create_autocmd('BufWritePre ', {
  pattern = { '*.jsx?', '*.tsx?' },
  command = 'EslintFixAll',
})

return {}
