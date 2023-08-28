return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          packer = {},
          NvimTree = {},
          statusline = {},
          winbar = {}
        },
        extensions = {
          'toggleterm',
          'nvim-tree',
          'fzf'
        }
      },
    },
  },
}
