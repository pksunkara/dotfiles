local wk = require('which-key')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup({
  defaults = {
    default_mappings = {
      i = {
        ['<ESC>'] = actions.close,

        ['<Down>'] = actions.move_selection_next,
        ['<Up>'] = actions.move_selection_previous,

        ['<CR>'] = actions.select_default,
        ['<C-t>'] = actions.select_tab,
        ['<C-s>'] = actions.select_horizontal,
        ['<C-v>'] = actions.select_vertical,

        ['<C-k>'] = actions.which_key,

        ['<C-Left>'] = actions.preview_scrolling_left,
        ['<C-Down>'] = actions.preview_scrolling_down,
        ['<C-Up>'] = actions.preview_scrolling_up,
        ['<C-Right>'] = actions.preview_scrolling_right,

        ['<PageDown>'] = actions.results_scrolling_down,
        ['<PageUp>'] = actions.results_scrolling_up,

        ['<M-Left>'] = actions.results_scrolling_left,
        ['<M-Down>'] = actions.results_scrolling_down,
        ['<M-Up>'] = actions.results_scrolling_up,
        ['<M-Right>'] = actions.results_scrolling_right,

        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,

        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

        ['<C-p>'] = actions.complete_tag,
        ['<C-r>w'] = actions.insert_original_cword,

        ['<C-j>'] = actions.nop,
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ['<C-w>'] = actions.delete_buffer + actions.move_selection_better,
        },
      },
    },
  },
  extensions = {
    undo = {
      use_delta = false,
    },
    ['telescope-tabs'] = {
      close_tab_shortcut_i = '<C-w>',
      close_tab_shortcut_n = '<C-w>',
    },
  },
})

wk.add({
  { '<leader>p', builtin.find_files, desc = 'Go to file' },
  { '<leader>b', builtin.buffers, desc = 'Go to buffer' },
  { '<leader>r', builtin.oldfiles, desc = 'Go to recent file' },
  { '<C-k><C-t>', builtin.colorscheme, desc = 'Change color theme' },
})

require('plugin_settings.telescope.tabs')
require('plugin_settings.telescope.undo')