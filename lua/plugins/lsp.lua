return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {}
      },
    },
    config = function()
      local lsp = require('lsp-zero').preset({
        name = 'recommended'
      })

      local cmp = require('cmp')

      local lspconfig = require('lspconfig')

      lsp.ensure_installed({
        'lua_ls',
        'eslint',
        'golangci_lint_ls',
        'volar',
        'tailwindcss',
        'elixirls'
      })

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        lsp.buffer_autoformat()
      end)

      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          --virtual_text = false,
          virtual_text = {
            prefix = '●',
            spacing = 4,
            severity_limit = 'Warning',
          },
          underline = true,
          signs = true,
          update_in_insert = true,
        }
      )

      lspconfig.volar.setup({
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
        settings = {
          css = {
            lint = {
              unknownAtRules = 'ignore'
            }
          },

          scss = {
            lint = {
              unknownAtRules = 'ignore'
            }
          }
        }
      })

      lspconfig.eslint.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
          })
        end,
      })

      lspconfig.graphql.setup {}

      lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

      lspconfig.elixir_ls.setup {}

      lsp.setup()

      cmp.setup({
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        },
        preselect = 'item',
        completion = {
          completeopt = 'menu, menuone, noinsert'
        }
      })
    end
  }
}
