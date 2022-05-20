require('hop').setup()

local map = vim.api.nvim_set_keymap
local map_opts = {
  noremap = true,
  silent = true,
}

map('', 't', '<cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR })<cr>', map_opts)
map('', 'T', '<cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR })<cr>', map_opts)
