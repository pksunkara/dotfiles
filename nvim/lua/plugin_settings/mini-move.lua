local wk = require('which-key')
local minimove = require('mini.move')

wk.add({
  {
    mode = 'ni',
    {
      '<A-h>',
      function()
        minimove.move_line('left')
      end,
      desc = 'Move line left',
    },
    {
      '<A-j>',
      function()
        minimove.move_line('down')
      end,
      desc = 'Move line down',
    },
    {
      '<A-k>',
      function()
        minimove.move_line('up')
      end,
      desc = 'Move line up',
    },
    {
      '<A-l>',
      function()
        minimove.move_line('right')
      end,
      desc = 'Move line right',
    },
    {
      '<A-left>',
      function()
        minimove.move_line('left')
      end,
      desc = 'Move line left',
    },
    {
      '<A-down>',
      function()
        minimove.move_line('down')
      end,
      desc = 'Move line down',
    },
    {
      '<A-up>',
      function()
        minimove.move_line('up')
      end,
      desc = 'Move line up',
    },
    {
      '<A-right>',
      function()
        minimove.move_line('right')
      end,
      desc = 'Move line right',
    },
  },
})

wk.add({
  {
    mode = 'xs',
    {
      '<A-h>',
      function()
        minimove.move_selection('left')
      end,
      desc = 'Move selection left',
    },
    {
      '<A-j>',
      function()
        minimove.move_selection('down')
      end,
      desc = 'Move selection down',
    },
    {
      '<A-k>',
      function()
        minimove.move_selection('up')
      end,
      desc = 'Move selection up',
    },
    {
      '<A-l>',
      function()
        minimove.move_selection('right')
      end,
      desc = 'Move selection right',
    },
    {
      '<A-left>',
      function()
        minimove.move_selection('left')
      end,
      desc = 'Move selection left',
    },
    {
      '<A-down>',
      function()
        minimove.move_selection('down')
      end,
      desc = 'Move selection down',
    },
    {
      '<A-up>',
      function()
        minimove.move_selection('up')
      end,
      desc = 'Move selection up',
    },
    {
      '<A-right>',
      function()
        minimove.move_selection('right')
      end,
      desc = 'Move selection right',
    },
  },
})
