local hop = require('hop')
local hop_hint = require('hop.hint')
local keymap = require('utils.keymap')

hop.setup()

local function set_hop_hint_keymap(map_key, opts)
  local inclusive_opts = vim.tbl_extend('force', opts, {
    inclusive_jump = true,
  })

  keymap.set({ 'n', 'v' }, map_key, function ()
    hop.hint_char1(opts)
  end)

  keymap.set('o', map_key, function ()
    vim.opt_local.virtualedit = 'onemore'
    hop.hint_char1(inclusive_opts)
    vim.opt_local.virtualedit = ''
  end)
end

local function set_hop_hint_keymap_bi(map_hint_after, map_hint_before, opts)
  local hint_after_opts = { direction = hop_hint.HintDirection.AFTER_CURSOR }
  local hint_before_opts = { direction = hop_hint.HintDirection.BEFORE_CURSOR }
  if opts then
    hint_after_opts = vim.tbl_extend('force', hint_after_opts, opts)
    hint_before_opts = vim.tbl_extend('force', hint_before_opts, opts)
  end

  set_hop_hint_keymap(map_hint_after, hint_after_opts)
  set_hop_hint_keymap(map_hint_before, hint_before_opts)
end

set_hop_hint_keymap_bi('t', 'T')
set_hop_hint_keymap_bi('f', 'F', {
  current_line_only = true,
})
