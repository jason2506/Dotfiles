local hop = require('hop')

local keymap = vim.keymap
local keymap_opts = {
  noremap = true,
  silent = true,
}

hop.setup()

keymap.set('', 't', function ()
  hop.hint_char1({
    direction = require("hop.hint").HintDirection.AFTER_CURSOR,
  })
end, keymap_opts)
keymap.set('', 'T', function ()
  hop.hint_char1({
    direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
  })
end, keymap_opts)
