local wk = require('which-key')
local picker = require('window-picker')
local api = require('nvim-tree.api')

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

local function on_attach(bufnr)
  local function opts(desc)
    return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', '<ESC>', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', '<CR>', api.node.open.no_window_picker, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.no_window_picker, opts('Open'))
  vim.keymap.set('n', '<Right>', api.node.open.no_window_picker, opts('Open'))
  vim.keymap.set('n', 'l', api.node.open.no_window_picker, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open in window'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: Tab'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Split'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close directory'))
  vim.keymap.set('n', '<Left>', api.node.navigate.parent_close, opts('Close directory'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close directory'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last sibling'))
  vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First sibling'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle bookmark'))
end

function centered_window()
  local screen_w = vim.opt.columns:get()
  local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()

  local window_w = screen_w * WIDTH_RATIO
  local window_h = screen_h * HEIGHT_RATIO

  local window_w_int = math.floor(window_w)
  local window_h_int = math.floor(window_h)

  local center_x = (screen_w - window_w) / 2
  local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

  return {
    border = 'rounded',
    relative = 'editor',
    row = center_y,
    col = center_x,
    width = window_w_int,
    height = window_h_int,
  }
end

function pick_window()
  api.tree.toggle()

  local win_id = picker.pick_window({
    filter_rules = {
      include_current_win = true,
    },
  })

  api.tree.toggle()

  return win_id
end

require('nvim-tree').setup({
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  on_attach = on_attach,
  actions = {
    open_file = {
      window_picker = {
        picker = pick_window,
      },
    },
  },
  view = {
    float = {
      enable = true,
      open_win_config = centered_window,
    },
  },
})

wk.add({
  {
    '<C-0>',
    '<D-0>',
    function()
      api.tree.find_file({ open = true, focus = true })
    end,
    desc = 'Open in file explorer',
  },
})
