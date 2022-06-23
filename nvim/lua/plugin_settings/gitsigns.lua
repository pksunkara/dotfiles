local wk = require('which-key')
local gitsigns = require('gitsigns')

local function revisions(fn, desc)
  return {
    { 'i', fn, desc = desc .. ' index' },
    {
      '0',
      function()
        fn('~0')
      end,
      desc = desc .. ' HEAD',
    },
    {
      '1',
      function()
        fn('~1')
      end,
      desc = desc .. ' HEAD~',
    },
    {
      '2',
      function()
        fn('~2')
      end,
      desc = desc .. ' HEAD~2',
    },
    {
      '3',
      function()
        fn('~3')
      end,
      desc = desc .. ' HEAD~3',
    },
  }
end

local function on_attach(bufnr)
  wk.add({
    {
      buffer = bufnr,
      {
        { '<leader>g', group = "Git" },
        { '<leader>gp', gitsigns.preview_hunk, desc = 'Preview hunk' },
        { '<leader>gv', gitsigns.select_hunk, desc = 'Select hunk' },
        {
          '<leader>gb',
          group = 'Buffer',
          expand = function()
            return {
              { 's', gitsigns.stage_buffer, desc = 'Stage buffer' },
              { 'u', gitsigns.reset_buffer_index, desc = 'Unstage buffer' },
              { 'r', gitsigns.reset_buffer, desc = 'Reset buffer' },
            }
          end
        },
        {
          '<leader>gh',
          group = 'Hunk',
          expand = function()
            return {
              { 's', gitsigns.stage_hunk, desc = 'Stage hunk' },
              { 'u', gitsigns.undo_stage_hunk, desc = 'Unstage hunk' },
              { 'r', gitsigns.reset_hunk, desc = 'Reset hunk' },
            }
          end
        },
        {
          '<leader>gw',
          group = "Show",
          expand = function()
            return revisions(gitsigns.show, 'Show')
          end
        },
      },
    },
  })

  wk.add({
    {
      buffer = bufnr, expr = true,
      {
        ']g',
        function()
          if vim.wo.diff then return ']g' end
          vim.schedule(gitsigns.next_hunk)
          return '<Ignore>'
        end,
        desc = 'Next git hunk',
      },
      {
        '[g',
        function()
          if vim.wo.diff then return ']g' end
          vim.schedule(gitsigns.prev_hunk)
          return '<Ignore>'
        end,
        desc = 'Previous git hunk',
      },
    },
  })
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

