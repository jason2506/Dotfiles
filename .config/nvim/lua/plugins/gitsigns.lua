local keymap = require('utils.keymap')
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Navigation
    local nav_map_opts = {
      buffer = bufnr,
      expr = true,
    }
    keymap.set('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(gs.next_hunk)
      return '<Ignore>'
    end, nav_map_opts)
    keymap.set('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(gs.prev_hunk)
      return '<Ignore>'
    end, nav_map_opts)

    -- Actions
    local act_map_opts = { buffer = bufnr }
    keymap.set('n', '<leader>gd', gs.diffthis, act_map_opts)
    keymap.set('n', '<leader>gt', gs.toggle_deleted, act_map_opts)
  end,
})
