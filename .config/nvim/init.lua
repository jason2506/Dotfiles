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
    '*.js',
    '*.jsx',
    '*.lua',
    '*.md',
    '*.scss',
    '*.ts',
    '*.tsx',
    '*.vim',
    '*.vue',
    '*.yaml',
    '*.yml',
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

keymap.set('n', '<leader>cd', function ()
  local default_path = vim.fn.expand('%:~:.:h')
  local input_opts = {
    prompt = 'Set working directory: ',
    default = default_path,
    completion = 'dir',
  }

  vim.ui.input(input_opts, function (target_path)
    if target_path then
      vim.api.nvim_set_current_dir(target_path)
    end
  end)
end, keymap_opts)

keymap.set('n', '<leader>e', function ()
  local default_path = vim.fn.expand('%:~:.')
  local input_opts = {
    prompt = 'Edit file: ',
    default = default_path,
    completion = 'file',
  }

  vim.ui.input(input_opts, function (target_path)
    if target_path then
      vim.cmd(':e ' .. target_path)
    end
  end)
end, keymap_opts)

require('plugins')
