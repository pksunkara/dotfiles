local wk = require('which-key')
local lspc = require('lspconfig')

lspc.rust_analyzer.setup({})

require('typescript-tools').setup({
  expose_as_code_action = 'all',
})

wk.add({
  { '<C-.>', '<D-.>', vim.lsp.buf.code_action, desc = 'Code actions', mode = 'nixsotc' },
})
