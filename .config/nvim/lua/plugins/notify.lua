local notify = require('notify')
notify.setup({
  minimum_width = 40,
  stages = 'slide',
})

-- override built-in notify
vim.notify = notify
