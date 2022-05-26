local keymap = require('utils.keymap')

keymap.set('n', '<leader>t', ':tabnew<CR>')

keymap.set('n', 'bt', ':bnext<CR>')
keymap.set('n', 'bT', ':bprev<CR>')

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
      vim.cmd(':tabedit ' .. target_path)
    end
  end)
end)
