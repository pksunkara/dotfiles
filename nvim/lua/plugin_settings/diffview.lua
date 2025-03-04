local wk = require('which-key')
local diffview = require('diffview')
local actions = require('diffview.actions')

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('DiffviewCommitLogPanel', { clear = true }),
  pattern = 'diffview://*/log/*/commit_log',
  desc = 'Map keys to close the diffview commit log panel',
  callback = function(args)
    vim.keymap.set('n', 'q', '<CMD>q<CR>', { buffer = args.buf, desc = 'Close the panel',
    })
    vim.keymap.set('n', '<ESC>', '<CMD>q<CR>', { buffer = args.buf, desc = 'Close the panel' })
  end,
})

diffview.setup({
  enhanced_diff_hl = true,
  view = {
    merge_tool = {
      layout = 'diff4_mixed',
    },
  },
  keymaps = {
    view = {
      { 'n', 'q', diffview.close, { desc = 'Close the panel' } },
    },
    file_panel = {
      { 'n', 'q', diffview.close, { desc = 'Close the panel' } },
    },
    file_history_panel = {
      { 'n', 'q', diffview.close, { desc = 'Close the panel' } },
    },
    option_panel = {
      { 'n', '<ESC>', actions.close, { desc = 'Close the panel' } },
    },
  },
})

wk.add({
  { '<leader>g', group = 'Git' },
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
        },
      }
    end,
  },
})
