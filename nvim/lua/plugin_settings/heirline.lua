local mode = require('plugin_settings.providers.mode')
local file = require('plugin_settings.providers.file')

local status_line = {}

-- vi-mode
status_line[1] = mode
status_line[2] = file

require('heirline').setup {
  statusline = status_line,
}
