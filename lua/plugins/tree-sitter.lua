return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'css',
          'diff',
          'elixir',
          'go',
          'graphql',
          'html',
          'javascript',
          'json',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'scss',
          'sql',
          'typescript',
          'vim',
          'vue'
        },
        hightlight = {
          enable = true
        },
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        autotag = {
          enable = true,
          filetypes = {
            'html',
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'vue',
          },
        },
        rainbow = {
          enable = true,
          disable = { 'html' },
          extended_mode = false,
          max_file_lines = nil,
        },

        additional_vim_regex_highlighting = false,
        context_commentstring = {
          enable = true
        }
      }
    end
  }
}
