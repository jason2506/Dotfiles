local hop = require('hop')
local hop_hint = require('hop.hint')
local keymap = require('utils.keymap')

hop.setup()

keymap.set('', 't', function ()
  hop.hint_char1({
    direction = hop_hint.HintDirection.AFTER_CURSOR,
  })
end)
keymap.set('', 'T', function ()
  hop.hint_char1({
    direction = hop_hint.HintDirection.BEFORE_CURSOR,
  })
end)
