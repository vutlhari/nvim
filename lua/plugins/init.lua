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
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-plenary',
      'nvim-neotest/neotest-jest',
      'nvim-neotest/neotest-go',
    },
    config = function()
      local neotest = require('neotest')
      -- require("neotest.logging"):set_level("trace")
      neotest.setup({
        adapters = {
          require('neotest-jest')({
            jestCommand = 'npx jest',
            cwd = require('neotest-jest').root,
            jest_test_discovery = false,
          }),
        },
        discovery = {
          enabled = false,
        },
        summary = {
          mappings = {
            attach = 'a',
            expand = 'l',
            expand_all = 'L',
            jumpto = 'gf',
            output = 'o',
            run = '<C-r>',
            short = 'p',
            stop = 'u',
          },
        },
        icons = {
          passed = ' ',
          running = ' ',
          failed = ' ',
          unknown = ' ',
          running_animated = vim.tbl_map(function(s)
            return s .. ' '
          end, { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }),
        },
        diagnostic = {
          enabled = true,
        },
        output = {
          enabled = true,
          open_on_run = false,
        },
        status = {
          enabled = true,
        },
      })

      vim.keymap.set('n', '<leader>tn', function()
        neotest.run.run({})
      end)

      vim.keymap.set('n', '<leader>tt', function()
        neotest.run.run({ vim.api.nvim_buf_get_name(0) })
      end)
      vim.keymap.set('n', '<leader>ta', function()
        for _, adapter_id in ipairs(neotest.run.adapters()) do
          neotest.run.run({ suite = true, adapter = adapter_id })
        end
      end)
      vim.keymap.set('n', '<leader>tl', function()
        neotest.run.run_last()
      end)
      vim.keymap.set('n', '<leader>td', function()
        neotest.run.run({ strategy = 'dap' })
      end)
      vim.keymap.set('n', '<leader>tp', function()
        neotest.summary.toggle()
      end)
      vim.keymap.set('n', '<leader>to', function()
        neotest.output.open()
      end)
    end,
  },
}
