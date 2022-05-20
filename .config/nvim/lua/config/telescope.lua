local telescope = require('telescope')
local actions = require('telescope.actions')
local themes = require('telescope.themes')

telescope.setup({
  defaults = themes.get_ivy({
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
    },
    file_ignore_patterns = {
      '.git',
      'node_modules',
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

local map = vim.api.nvim_set_keymap
local map_opts = {
  noremap = true,
  silent = true,
}

map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', map_opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', map_opts)
map('n', '<leader>fs', '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<cr>', map_opts)
map('n', '<leader>ft', '<cmd>lua require("telescope.builtin").treesitter()<cr>', map_opts)
