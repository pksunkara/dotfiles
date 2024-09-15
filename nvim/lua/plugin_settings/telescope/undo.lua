local wk = require('which-key')
local telescope = require('telescope')

telescope.load_extension('undo')

wk.add({
  { '<leader>u', telescope.extensions.undo.undo, desc = 'Open undo tree' },
})
