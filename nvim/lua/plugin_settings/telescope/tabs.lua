local wk = require('which-key')
local telescope = require('telescope')

telescope.load_extension('telescope-tabs')

wk.add({
  { 'g<TAB>', telescope.extensions['telescope-tabs'].go_to_previous, desc = 'Go to recent tab page' },
  { '<leader>t', telescope.extensions['telescope-tabs'].list_tabs, desc = 'Go to tab page' },
})
