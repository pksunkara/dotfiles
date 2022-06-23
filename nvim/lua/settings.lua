-- Formatting
vim.o.shiftwidth = 0
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- Editor
vim.o.number = true
vim.o.wrap = false
vim.o.showmatch = true
vim.o.signcolumn = 'yes'
vim.o.cursorline = true
vim.opt.cursorlineopt = 'number'

vim.o.list = true
vim.opt.listchars = {
  extends = '»',
  precedes = '«',
  tab = '› ',
  trail = '‹',
}

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Misc
vim.o.laststatus = 3
vim.o.tabpagemax = 15
vim.o.showmode = false
