local keymap = vim.keymap
local keymap_opts = {
  noremap = true,
  silent = true,
}

keymap.set('n', '<leader>t', ':tabnew<CR>', keymap_opts)

keymap.set('n', 'bt', ':bnext<CR>', keymap_opts)
keymap.set('n', 'bT', ':bprev<CR>', keymap_opts)

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
