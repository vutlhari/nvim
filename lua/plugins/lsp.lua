return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'nvimtools/none-ls.nvim' },
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {}
      },

    },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.diagnostics.eslint_d.with({
            condition = function(utils)
              return utils.root_has_file({ '.eslintrc', '.eslintrc.cjs' })
            end,
          }),
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.code_actions.gitsigns,
        },
        root_dir = require('null-ls.utils').root_pattern('.null-ls-root', 'Makefile', 'package.json', '.git'),
      })

      local lsp = require('lsp-zero').preset({
        name = 'recommended'
      })

      local cmp = require('cmp')

      local lspconfig = require('lspconfig')

      lsp.ensure_installed({
        'gopls',
        'lua_ls',
        'eslint',
        'golangci_lint_ls',
        'volar',
        'tailwindcss',
        'templ'
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

      require('lspconfig').volar.setup({
        on_init = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentFormattingRangeProvider = false
        end,
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
        settings = {
          css = {
            lint = {
              unknownAtRules = 'ignore',
            },
          },

          scss = {
            lint = {
              unknownAtRules = 'ignore',
            },
          },
        },
      })

      lspconfig.gopls.setup({
        on_attach = lsp.on_attach,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      lspconfig.templ.setup({
        on_attach = lsp.on_attach,
      })

      lspconfig.graphql.setup {}

      local lua_opts = lsp.nvim_lua_ls({
        on_init = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentFormattingRangeProvider = false
        end,
      })

      lspconfig.lua_ls.setup(lua_opts)

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      local cmp_format = require('lsp-zero').cmp_format()
      cmp.setup({
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        sources = {
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<Tab>'] = cmp_action.luasnip_supertab(),
          ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        }),
        formatting = cmp_format,
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  }
}
