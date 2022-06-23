local wk = require('which-key')
local gitsigns = require('gitsigns')

local function revisions(name, desc, fn)
  return {
    name = name,
    i = { fn, desc .. ' index' },
    ['0'] = {
      function()
        fn('~0')
      end,
      desc .. ' HEAD',
    },
    ['1'] = {
      function()
        fn('~1')
      end,
      desc .. ' HEAD~',
    },
    ['2'] = {
      function()
        fn('~2')
      end,
      desc .. ' HEAD~2',
    },
    ['3'] = {
      function()
        fn('~3')
      end,
      desc .. ' HEAD~3',
    },
  }
end

local function on_attach(bufnr)
  wk.register({
    name = 'Git',
    p = { gitsigns.preview_hunk, 'Preview hunk' },
    v = { gitsigns.select_hunk, 'Select hunk' },
    b = {
      name = 'Buffer',
      s = { gitsigns.stage_buffer, 'Stage buffer' },
      u = { gitsigns.reset_buffer_index, 'Unstage buffer' },
      r = { gitsigns.reset_buffer, 'Reset buffer' },
    },
    h = {
      name = 'Hunk',
      s = { gitsigns.stage_hunk, 'Stage hunk' },
      u = { gitsigns.undo_stage_hunk, 'Undo stage hunk' },
      r = { gitsigns.reset_hunk, 'Reset hunk' },
    },
    w = revisions('Show', 'Show', gitsigns.show),
  }, { prefix = '<leader>g', buffer = bufnr })

  wk.register({
    [']g'] = {
      function()
        if vim.wo.diff then return ']g' end
        vim.schedule(gitsigns.next_hunk)
        return '<Ignore>'
      end,
      'Next git hunk',
    },
    ['[g'] = {
      function()
        if vim.wo.diff then return ']g' end
        vim.schedule(gitsigns.prev_hunk)
        return '<Ignore>'
      end,
      'Previous git hunk',
    },
  }, { buffer = bufnr, expr = true })
end

gitsigns.setup({
  on_attach = on_attach,

  signs = {
    delete = { text = '┃' },
    topdelete = { text = '‾' },
    changedelete = { text = '┃' },
  },

  _signs_staged = {
    delete = { text = '┃' },
    topdelete = { text = '‾' },
    changedelete = { text = '┃' },
  },

  _signs_staged_enable = true,

  status_formatter = function(status)
    local added = status.added or 0
    local changed = status.changed or 0
    local removed = status.removed or 0

    return '⊕ ' .. added .. '⊙ ' .. changed .. '⊗ ' .. removed
  end,
})

