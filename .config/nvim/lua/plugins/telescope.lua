local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local keymap = require('utils.keymap')

telescope.setup({
  defaults = themes.get_ivy({
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
    },
    file_ignore_patterns = {
      '.git/',
      'node_modules/',
    },
  }),
  pickers = {
    find_files = {
      find_command = {
        'rg',
        '--hidden',
        '--files',
      },
    },
    live_grep = {
      additional_args = function()
        -- allow hidden files to be grepped
        return { '--hidden' }
      end,
    },
  },
  extensions = {
    file_browser = {
      path = '%:p:h',
      select_buffer = true,
    },
    ['ui-select'] = {
      themes.get_cursor(),
    },
  },
})

telescope.load_extension('file_browser')
telescope.load_extension('ui-select')

keymap.set('n', '<leader>ff', builtin.find_files)
keymap.set('n', '<leader>fa', function()
  builtin.find_files({
    find_command = {
      'rg',
      '--hidden',
      '--no-ignore',
      '--files',
    },
  })
end)
keymap.set('n', '<leader>f.', telescope.extensions.file_browser.file_browser)
keymap.set('n', '<leader>fb', builtin.buffers)
keymap.set('n', '<leader>fd', builtin.diagnostics)
keymap.set('n', '<leader>fw', builtin.live_grep)
keymap.set('n', '<leader>fh', builtin.help_tags)
keymap.set('n', '<leader>ft', builtin.treesitter)
