require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  ensure_installed = {
    -- default
    'c',
    'lua',
    'vim',
    'vimdoc',
    'query',
    'markdown',
    'markdown_inline',
    -- markup & data
    'json',
    'yaml',
    'toml',
    'xml',
    -- web
    'html',
    'css',
    -- languages
    'rust',
    'typescript',
    'tsx',
    'javascript',
    'go',
    'python',
    'ruby',
    -- others
    'bash',
    'fish',
    'sql',
    'graphql',
    'terraform',
    'nix',
  },
})
