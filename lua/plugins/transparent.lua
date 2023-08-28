return {
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup {
        'NormalFloat',
        extra_groups = {
          'NvimTreeNormal',
          'ToggleTerm'
        }
      }
      vim.keymap.set('n', '<S-F6>', ':TransparentToggle<CR>')
    end
  },
}
