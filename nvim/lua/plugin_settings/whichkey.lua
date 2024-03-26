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
    ['<esc>'] = 'ESC',
    ['<bs>'] = 'BS',
    ['<space>'] = 'SPC',
    ['<cr>'] = 'RET',
    ['<tab>'] = 'TAB',
  },
})

wk.register({
  k = { wk.show, 'Open which key' }
}, { prefix = '<leader>' })
