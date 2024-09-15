local wk = require('which-key')
local diffview = require('diffview')
local actions = require('diffview.actions')

diffview.setup({
  enhanced_diff_hl = true,
  view = {
    merge_tool = {
      layout = 'diff4_mixed',
    },
  },
  keymaps = {
    view = {
      ['q'] = diffview.close,
    },
    file_panel = {
      ['q'] = diffview.close,
    },
    file_history_panel = {
      ['q'] = diffview.close,
    },
  },
})

wk.add({
  { '<leader>g', group = "Git" },
  {
    '<leader>gd',
    group = 'Diff',
    expand = function()
      return {
        { 'i', diffview.open, desc = 'Diff' },
        {
          'h',
          function()
            return diffview.open('HEAD')
          end,
          desc = 'Diff all',
        },
        {
          's',
          function()
            return diffview.open('--staged')
          end,
          desc = 'Diff staged',
        }
      }
    end,
  },
})
