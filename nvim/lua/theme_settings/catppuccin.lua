require('catppuccin').setup({
  highlight_overrides = {
    mocha = function(C)
      return {
        GitSignsChangeDelete = { fg = C.lavender },
      }
    end,
  },
  integrations = {
    alpha = false,
    dashboard = false,
    which_key = true,
    window_picker = true,
  },
})
