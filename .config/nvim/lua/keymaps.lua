local keymap = require('utils.keymap')

keymap.set('n', '<leader>bd', ':bd<cr>')
keymap.set('n', '[b', ':bprev<cr>')
keymap.set('n', ']b', ':bnext<cr>')

local diagnostic = vim.diagnostic
keymap.set('n', '<leader>ld', diagnostic.open_float)
keymap.set('n', '[d', diagnostic.goto_prev)
keymap.set('n', ']d', diagnostic.goto_next)

keymap.set('v', '>', '>gv')
keymap.set('v', '<', '<gv')

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
end)

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
end)
