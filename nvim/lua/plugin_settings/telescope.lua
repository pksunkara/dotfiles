local wk = require('which-key')
local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
  extensions = {
    undo = {
      use_delta = false,
    },
  },
})

wk.register({
  ['<leader>'] = {
    p = { builtin.find_files, 'Go to file' },
    b = { builtin.buffers, 'Go to buffer' },
    r = { builtin.oldfiles, 'Go to recent file' },
  },
  ['<C-k><C-t>'] = { builtin.colorscheme, 'Change color theme' },
})

require('plugin_settings.telescope.undo')
