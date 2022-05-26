local hop = require('hop')
local keymap = require('utils.keymap')

hop.setup()

keymap.set('', 't', function ()
  hop.hint_char1({
    direction = require("hop.hint").HintDirection.AFTER_CURSOR,
  })
end)
keymap.set('', 'T', function ()
  hop.hint_char1({
    direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
  })
end)
