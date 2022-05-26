require('toggleterm').setup({
  open_mapping = '<c-\\>',
})

local au = vim.api.nvim_create_autocmd
local keymap = require('utils.keymap')
local keymap_opts = {
  buffer = true,
}

au('TermOpen', {
  pattern = 'term://*',
  callback = function ()
    keymap.set('t', '<c-w>h', '<c-\\><c-n><c-w>h', keymap_opts)
    keymap.set('t', '<c-w>j', '<c-\\><c-n><c-w>j', keymap_opts)
    keymap.set('t', '<c-w>k', '<c-\\><c-n><c-w>k', keymap_opts)
    keymap.set('t', '<c-w>l', '<c-\\><c-n><c-w>l', keymap_opts)

    keymap.set('t', '<c-w><up>', '<c-\\><c-n><c-w><up>', keymap_opts)
    keymap.set('t', '<c-w><down>', '<c-\\><c-n><c-w><down>', keymap_opts)
    keymap.set('t', '<c-w><left>', '<c-\\><c-n><c-w><left>', keymap_opts)
    keymap.set('t', '<c-w><right>', '<c-\\><c-n><c-w><right>', keymap_opts)

    keymap.set('t', '<c-w>[', '<c-\\><c-n>', keymap_opts)
    keymap.set('n', 'q', 'i', keymap_opts)
  end
})
