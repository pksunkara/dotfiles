local wk = require('which-key')
local telescope = require('telescope')

telescope.load_extension('undo')

wk.register({
  ['<leader>u'] = { telescope.extensions.undo.undo, 'Open undo tree' },
})
