vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
  command = 'EslintFixAll',
})

return {}
