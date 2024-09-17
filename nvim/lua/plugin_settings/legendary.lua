local wk = require('which-key')
local legendary = require('legendary')
local filters = require('legendary.filters')

legendary.setup({
  extensions = {
    which_key = {
      auto_register = true,
    },
  },
})

wk.add({
  {
    '<C-S-p>',
    function()
      legendary.find({
        filters = {
          filters.current_mode(),
        },
      })
    end,
    desc = 'Open command palette',
  },
})
