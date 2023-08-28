return {
  {
    'folke/which-key.nvim',
    opts = {}
  },
  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = function()
      require('better_escape').setup()
    end,
  },
  { 'jiangmiao/auto-pairs' },
  {
    'f-person/git-blame.nvim',
    event = 'VeryLazy',
  },
  { 'nvim-tree/nvim-web-devicons' },
}
