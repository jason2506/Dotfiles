require('toggleterm').setup({
  open_mapping = '<c-\\>',
})

local au = vim.api.nvim_create_autocmd
local buf_map = vim.api.nvim_buf_set_keymap
local map_opts = {
  noremap = true,
  silent = true,
}

au('TermOpen', {
  pattern = 'term://*',
  callback = function ()
    buf_map(0, 't', '<c-w>h', '<c-\\><c-n><c-w>h', map_opts)
    buf_map(0, 't', '<c-w>j', '<c-\\><c-n><c-w>j', map_opts)
    buf_map(0, 't', '<c-w>k', '<c-\\><c-n><c-w>k', map_opts)
    buf_map(0, 't', '<c-w>l', '<c-\\><c-n><c-w>l', map_opts)

    buf_map(0, 't', '<c-w><up>', '<c-\\><c-n><c-w><up>', map_opts)
    buf_map(0, 't', '<c-w><down>', '<c-\\><c-n><c-w><down>', map_opts)
    buf_map(0, 't', '<c-w><left>', '<c-\\><c-n><c-w><left>', map_opts)
    buf_map(0, 't', '<c-w><right>', '<c-\\><c-n><c-w><right>', map_opts)
  end
})
