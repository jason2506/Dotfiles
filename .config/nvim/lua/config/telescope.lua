local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local keymap = vim.keymap
local keymap_opts = {
  noremap = true,
  silent = true,
}

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
        'rg', '--hidden', '--files',
      },
    },
    live_grep = {
      additional_args = function ()
        -- allow hidden files to be grepped
        return { '--hidden' }
      end,
    },
  },
  extensions = {
    ['ui-select'] = {
      themes.get_cursor(),
    },
  },
})

telescope.load_extension('ui-select')

keymap.set('n', '<leader>ff', builtin.find_files, keymap_opts)
keymap.set('n', '<leader>fa', function ()
  builtin.find_files({
    find_command = {
      'rg', '--hidden', '--no-ignore', '--files',
    }
  })
end, keymap_opts)
keymap.set('n', '<leader>fb', builtin.buffers, keymap_opts)
keymap.set('n', '<leader>fd', builtin.diagnostics, keymap_opts)
keymap.set('n', '<leader>fg', builtin.live_grep, keymap_opts)
keymap.set('n', '<leader>fh', builtin.help_tags, keymap_opts)
keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, keymap_opts)
keymap.set('n', '<leader>ft', builtin.treesitter, keymap_opts)
