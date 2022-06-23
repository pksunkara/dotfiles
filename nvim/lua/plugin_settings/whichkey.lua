local wk = require('which-key')

wk.setup({
  icons = {
    separator = '󰁔',
  },
  layout = {
    spacing = 10,
  },
  key_labels = {
    ['<leader>'] = '\\',
    ['<localleader>'] = '\\',
    ['<ESC>'] = 'ESC',
    ['<BS>'] = 'BS',
    ['<SPACE>'] = 'SPC',
    ['<CR>'] = 'RET',
    ['<TAB>'] = 'TAB',
  },
})

wk.register({
  k = { wk.show, 'Open which key' }
}, { prefix = '<leader>' })
