local wk = require('which-key')

wk.setup({
  icons = {
    separator = '󰁔',
  },
  win = {
    no_overlap = false,
  },
  layout = {
    spacing = 10,
  },
})

wk.add({
  { '<leader>k', wk.show, desc = 'Open which key' },
})
