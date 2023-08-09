local o = vim.o
local bo = vim.bo
local au = vim.api.nvim_create_autocmd

o.colorcolumn = '80,120'
o.completeopt = 'menuone,noinsert,noselect'
o.cursorline = true
o.swapfile = false
o.number = true
o.mouse = 'nv'
o.clipboard = 'unnamedplus'
o.laststatus = 3

local wildignores = {
  '*.o',
  '*.obj',
  '*.so',
  '*.pyc',
  '*__pycache__/*',
  '*.png',
  '*.jpg',
  '*.gif',
  '*.ico',
  '*.swo',
  '*.swp',
  '*.db',
  '*.sqlite',
  '.DS_Store',
  '*/CMakeFiles/*',
  'CMakeCache.txt',
  '*/node_modules/*',
  '*/.git/*',
}
for _, wildignore in ipairs(wildignores) do
  o.wildignore = o.wildignore .. wildignore .. ','
end

o.smartindent = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

au({ 'BufNewFile', 'BufFilePre', 'BufRead' }, {
  pattern = {
    '*.css',
    '*.gql',
    '*.graphql',
    '*.html',
    '*.json',
    '*.js',
    '*.jsx',
    '*.lua',
    '*.md',
    '*.prisma',
    '*.scss',
    '*.ts',
    '*.tsx',
    '*.vim',
    '*.vue',
    '*.yaml',
    '*.yml',
  },
  callback = function()
    bo.tabstop = 2
    bo.shiftwidth = 2
    bo.softtabstop = 2
  end,
})

vim.diagnostic.config({
  float = {
    max_width = 100,
    border = 'rounded',
    source = 'always',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})
