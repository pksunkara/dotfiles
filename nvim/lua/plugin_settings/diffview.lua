local wk = require('which-key')
local diffview = require('diffview')

diffview.setup({})

wk.register({
  d = { diffview.open, 'Diff with HEAD' },
}, { prefix = '<leader>g' })
