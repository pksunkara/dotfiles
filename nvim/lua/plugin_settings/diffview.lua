local wk = require('which-key')
local diffview = require('diffview')

diffview.setup({})

wk.add({
  { '<leader>gd', diffview.open, desc = 'Diff with HEAD' },
})
