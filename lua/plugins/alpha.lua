return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local buttons = {
        type = 'group',
        val = {
          { type = 'text', val = 'Quick links', opts = { hl = 'SpecialComment', position = 'center' } },
        }
      }
      local theta = require('alpha.themes.dashboard')
      theta.section.buttons.val = {
        theta.button('e', '  New file', '<cmd>ene<CR>'),
        theta.button('<leader> s f', '󰈞  Find file'),
        theta.button('<leader> s g', '󰊄  Live grep'),
        theta.button('c', '  Configuration', '<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>'),
        theta.button('u', '  Update plugins', '<cmd>Lazy sync<CR>'),
        theta.button('q', '󰅚  Quit', '<cmd>qa<CR>'),
        theta.button('<S-F6>', ' Toggle Transparent Background', '<cmd>TransparentToggle<CR>')
      }
      require 'alpha'.setup(theta.opts)
    end
  }
}
