local C = require('catppuccin.palettes').get_palette('mocha');
local U = require('catppuccin.utils.colors')

local M = {}

local mode_text = {
  ['n'] = 'NORMAL',
  ['no'] = 'OP',
  ['nov'] = 'OP-CHAR',
  ['noV'] = 'OP-LINE',
  ['no'] = 'OP-BLOCK',
  ['niI'] = 'NORMAL (I)',
  ['niR'] = 'NORMAL (R)',
  ['niV'] = 'NORMAL (V)',
  ['v'] = 'VISUAL',
  ['vs'] = 'VISUAL (S)',
  ['V'] = 'V-LINE',
  ['Vs'] = 'V-LINE (S)',
  [''] = 'V-BLOCK',
  ['s'] = 'V-BLOCK (S)',
  ['s'] = 'SELECT',
  ['S'] = 'S-LINE',
  [''] = 'S-BLOCK',
  ['i'] = 'INSERT',
  ['ic'] = 'COMPL (I)',
  ['ix'] = 'COMPL (I)',
  ['R'] = 'REPLACE',
  ['Rc'] = 'COMPL (R)',
  ['Rx'] = 'COMPL (R)',
  ['Rv'] = 'VIRTUAL',
  ['Rvc'] = 'COMPL (V)',
  ['Rvx'] = 'COMPL (V)',
  ['c'] = 'COMMAND',
  ['cv'] = 'EX',
  ['ce'] = 'EX',
  ['r'] = 'PROMPT',
  ['rm'] = 'MORE',
  ['r?'] = 'CONFIRM',
  ['!'] = 'SHELL',
  ['t'] = 'TERM',
  ['nt'] = 'TERM',
  ['null'] = 'NONE',
}

local mode_name_max_length = math.max(
  unpack(
    vim.tbl_map(function(str)
      return #str
    end, vim.tbl_values(mode_text))
  )
)

local mode_colors_id = {
  ['NORMAL'] = 'NORMAL',
  ['NORMAL (I)'] = 'NORMAL',
  ['NORMAL (R)'] = 'NORMAL',
  ['NORMAL (V)'] = 'NORMAL',
  ['VISUAL'] = 'VISUAL',
  ['VISUAL (S)'] = 'VISUAL',
  ['V-LINE'] = 'VISUAL',
  ['V-LINE (S)'] = 'VISUAL',
  ['V-BLOCK'] = 'VISUAL',
  ['V-BLOCK (S)'] = 'VISUAL',
  ['SELECT'] = 'SELECT',
  ['S-LINE'] = 'SELECT',
  ['S-BLOCK'] = 'SELECT',
  ['INSERT'] = 'INSERT',
  ['COMPL (I)'] = 'INSERT',
  ['REPLACE'] = 'REPLACE',
  ['COMPL (R)'] = 'REPLACE',
  ['VIRTUAL'] = 'REPLACE',
  ['COMPL (V)'] = 'REPLACE',
  ['COMMAND'] = 'COMMAND',
  ['EX'] = 'COMMAND',
  ['PROMPT'] = 'COMMAND',
  ['MORE'] = 'COMMAND',
  ['CONFIRM'] = 'COMMAND',
  ['SHELL'] = 'TERM',
  ['TERM'] = 'TERM',
}

local mode_colors = {
  NORMAL = C.blue,
  INSERT = C.green,
  VISUAL = C.flamingo,
  REPLACE = C.maroon,
  COMMAND = C.peach,
}

function M.init(self)
  self.mode = vim.api.nvim_get_mode().mode
  self.mode_text = mode_text[self.mode]
end

function M.provider(self)
  local val = self.mode_text

  -- pad the mode name to the max length
  local padding_length = mode_name_max_length - #val

  vim.print(mode_name_max_length)

  return string.rep(' ', math.floor(padding_length / 2))
      .. val
      .. string.rep(' ', math.ceil(padding_length / 2))
end

function M.hl(self)
  local val = {}
  local mode = mode_colors_id[self.mode_text]

  if mode_colors[mode] then
    val.bg = mode_colors[mode]
  end

  val.fg = C.mantle
  val.bold = true

  return val
end

M.update = {
  "ModeChanged",
  pattern = "*:*",
  callback = vim.schedule_wrap(
    function()
      vim.cmd("redrawstatus")
    end
  ),
}

return M
