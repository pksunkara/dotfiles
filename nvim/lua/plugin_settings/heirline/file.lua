local icons = require('nvim-web-devicons')
local conditions = require('heirline.conditions')

local M = {}

function M.init(self)
  self.filename = vim.api.nvim_buf_get_name(0)
  self.extension = vim.fn.fnamemodify(self.filename, ':e')

  self.icon, self.icon_color = icons.get_icon_color(self.filename, self.extension, { default = true })
end

function M.provider(self)
  local filename = vim.fn.fnamemodify(self.filename, ':.')
  local ret

  if self.icon then
    ret = ' ' .. self.icon .. ' ' .. filename
  else
    ret = filename
  end

  return ret .. ' '
end

function M.hl(self)
  return {
    fg = self.icon_color,
    bold = true,
  }
end

return M
