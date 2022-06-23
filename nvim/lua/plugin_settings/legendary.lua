local wk = require('which-key')
local legendary = require('legendary')
local filters = require('legendary.filters')

legendary.setup {
  which_key = {
    auto_register = true,
  },
}

wk.register({
  P = {
    function()
      legendary.find({
        filters = {
          filters.current_mode(),
        },
      })
    end,
    'Open command palette',
  },
}, { prefix = '<leader>' })
