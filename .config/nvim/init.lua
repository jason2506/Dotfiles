local o = vim.o
local bo = vim.bo
local au = vim.api.nvim_create_autocmd
local map = vim.api.nvim_set_keymap
local map_opts = {
  noremap = true,
  silent = true,
}

-- Basic Setting(s)
o.colorcolumn = '80,120'
o.completeopt = 'menuone,noinsert,noselect'
o.cursorline = true
o.swapfile = false
o.number = true
o.mouse = 'a'
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
map('n', '<leader>t', ':tabnew<CR>', map_opts)

-- Buffer Shortcut(s)
map('n', 'bt', ':bnext<CR>', map_opts)
map('n', 'bT', ':bprev<CR>', map_opts)

-- Indent Shortcut(s)
map('v', '>', '>gv', map_opts)
map('v', '<', '<gv', map_opts)

require('plugins')
