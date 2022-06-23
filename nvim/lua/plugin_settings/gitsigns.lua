local wk = require('which-key')
local gitsigns = require('gitsigns')

local function on_attach(bufnr)
  wk.register({
    name = "Git staging",
    p = { gitsigns.preview_hunk, 'Preview hunk' },
    S = { gitsigns.stage_buffer, 'Stage buffer' },
    U = { gitsigns.reset_buffer_index, 'Unstage buffer' },
    R = { gitsigns.reset_buffer, 'Reset buffer' },
    s = { gitsigns.stage_hunk, 'Stage hunk' },
    u = { gitsigns.undo_stage_hunk, 'Undo stage hunk' },
    r = { gitsigns.reset_hunk, 'Reset hunk' },
    d = { gitsigns.diffthis, 'Diff file' },
    D = {
      function()
        gitsigns.diffthis('~')
      end,
      'Diff file (cached)',
    },
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

gitsigns.setup {
  on_attach = on_attach,

  signs = {
    add = { text = '⊕' },
    change = { text = '⊙' },
    delete = { text = '⊗' },
    topdelete = { text = '⊛' },
    changedelete = { text = '⊖' },
    untracked = { text = '┆' },
  },

  status_formatter = function(status)
    local added = status.added or 0
    local changed = status.changed or 0
    local removed = status.removed or 0

    return '⊕ ' .. added .. '⊙ ' .. changed .. '⊗ ' .. removed
  end,
}
