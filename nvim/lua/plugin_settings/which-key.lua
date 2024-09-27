local wk = require('which-key')
local wk_add = wk.add

local map_spec

map_spec = function(mappings)
  -- If it is not group
  if type(mappings[1]) == 'string' then
    -- Return the mapping as is if not modified
    if mappings[3] == nil then
      return mappings
    end

    -- OS specific mappings
    -- ex: { '<C-r>', '<D-r>', 'Redo' }
    local linux = table.remove(mappings, 1)
    local mac = table.remove(mappings, 1)
    local rhs = table.remove(mappings, 1)

    -- If there is a condition, store it and remove from common elements
    local cond = mappings.cond
    mappings.cond = nil

    -- Looks like description is not allowed in nested
    local desc = mappings.desc
    mappings.desc = nil

    return {
      mappings,
      {
        linux,
        rhs,
        desc = desc,
        cond = function()
          return vim.fn.has('linux') > 0 and (cond == nil or cond())
        end,
      },
      {
        mac,
        rhs,
        desc = desc,
        cond = function()
          return vim.fn.has('mac') > 0 and (cond == nil or cond())
        end,
      },
    }
  end

  -- Map everything in the group
  local r = mappings

  for i, mapping in ipairs(mappings) do
    r[i] = map_spec(mapping)
  end

  return r
end

-- Override wk.add to support:
-- 1. linux & mac specific mappings
wk.add = function(mappings, opts)
  wk_add(map_spec(mappings), opts)
end

wk.setup({
  icons = {
    separator = '󰁔',
  },
  keys = {
    scroll_down = '<C-Down>',
    scroll_up = '<C-Up>',
  },
  win = {
    no_overlap = false,
  },
  layout = {
    spacing = 10,
  },
})

wk.add({
  { '<C-k><C-k>', '<D-k><D-k>', wk.show, desc = 'Open which key', mode = 'nixsotc' },
})
