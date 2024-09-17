require('catppuccin').setup({
  color_overrides = {
    mocha = {
      base = '#020202',
      mantle = '#010101',
      crust = '#000000',
    },
  },
  highlight_overrides = {
    mocha = function(C)
      return {
        -- gitsigns
        GitSignsChangeDelete = { fg = C.lavender },

        -- eyeliner
        EyelinerPrimary = { fg = C.red },
        EyelinerSecondary = { fg = C.sky },
      }
    end,
  },
  integrations = {
    alpha = false,
    dashboard = false,
    diffview = true,
    which_key = true,
    window_picker = true,
  },
})
