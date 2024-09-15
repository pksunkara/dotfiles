local wk = require('which-key')
local gitsigns = require('gitsigns')

local function on_attach(bufnr)
  wk.add({
    {
      buffer = bufnr,
      {
        {
          '<leader>gf',
          group = 'File',
          expand = function()
            return {
              { 's', gitsigns.stage_buffer, desc = 'Stage file' },
              { 'u', gitsigns.reset_buffer_index, desc = 'Unstage file' },
              { 'r', gitsigns.reset_buffer, desc = 'Reset file' },
            }
          end,
        },
        {
          '<leader>gh',
          group = 'Hunk',
          expand = function()
            return {
              { 'p', gitsigns.preview_hunk, desc = 'Preview hunk' },
              { 'v', gitsigns.select_hunk, desc = 'Select hunk' },
              { 's', gitsigns.stage_hunk, desc = 'Stage hunk' },
              { 'u', gitsigns.undo_stage_hunk, desc = 'Unstage hunk' },
              { 'r', gitsigns.reset_hunk, desc = 'Reset hunk' },
            }
          end,
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

