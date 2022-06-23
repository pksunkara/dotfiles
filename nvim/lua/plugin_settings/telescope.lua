local wk = require('which-key')
local builtin = require('telescope.builtin')

wk.register({
  p = { builtin.find_files, 'Go to file' },
  b = { builtin.buffers, 'Go to buffer' },
}, { prefix = '<leader>' })
