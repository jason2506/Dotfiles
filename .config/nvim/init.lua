local o = vim.o
local bo = vim.bo
local au = vim.api.nvim_create_autocmd
local keymap = vim.keymap
local keymap_opts = {
  noremap = true,
  silent = true,
}

-- Basic Setting(s)
o.colorcolumn = '80,120'
o.completeopt = 'menuone,noinsert,noselect'
o.cursorline = true
o.swapfile = false
o.number = true
o.mouse = 'nv'
o.clipboard = 'unnamedplus'

-- Ignore File(s)
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

-- Indent Setting(s)
o.smartindent = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

au({ 'BufNewFile', 'BufFilePre', 'BufRead' }, {
  pattern = {
    '*.css',
    '*.fish',
    '*.html',
    '*.json',
    '*.jsx?',
    '*.lua',
    '*.md',
    '*.scss',
    '*.tsx?',
    '*.vim',
    '*.vue',
    '*.ya?ml',
  },
  callback = function ()
    bo.tabstop = 2
    bo.shiftwidth = 2
    bo.softtabstop = 2
  end
})

-- Tab Shortcut(s)
keymap.set('n', '<leader>t', ':tabnew<CR>', keymap_opts)

-- Buffer Shortcut(s)
keymap.set('n', 'bt', ':bnext<CR>', keymap_opts)
keymap.set('n', 'bT', ':bprev<CR>', keymap_opts)

-- Indent Shortcut(s)
keymap.set('v', '>', '>gv', keymap_opts)
keymap.set('v', '<', '<gv', keymap_opts)

require('plugins')
