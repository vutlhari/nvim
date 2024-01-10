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
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lspsaga').setup({})
      vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
      vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<cr>')
      vim.keymap.set('n', 'gf', '<cmd>Lspsaga finder<cr>')
      vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<cr>')
      vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
    end,
  },
}
