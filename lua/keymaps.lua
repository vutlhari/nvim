vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local wk = require("which-key")
local builtin = require("telescope.builtin")
local neotest = require("neotest")
local harpoon = require("harpoon")

wk.register({
  ["<leader>"] = {
    ["]"] = { ":bn<cr>", "Next buffer" },
    ["["] = { ":bp<cr>", "Previous buffer" },
    ["1"] = {
      function()
        vim.cmd(":ToggleTerm 1 name=foo")
      end,
      "Terminal 1",
    },
    ["2"] = {
      function()
        vim.cmd(":ToggleTerm 2 name=bar")
      end,
      "Terminal 2",
    },
    ["bd"] = { ":bd<cr>", "Delete buffer" },
    ["lg"] = { "<cmd>LazyGit<cr>", "Lazygit" },
    ["rn"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    a = {
      function()
        harpoon:list():add()
      end,
      "Add file to Harpoon",
    },
    d = {
      name = "+Diagnostics",
      d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostics open" },
      l = { builtin.diagnostics, "Diagnostics list" },
      n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Diagnostics next" },
    },
    e = { "<cmd>NvimTreeFindFileToggle<cr>", "File tree" },
    E = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "File browser" },
    f = {
      name = "+Find",
      s = { builtin.current_buffer_fuzzy_find, "Find in current buffer" },
      f = { builtin.find_files, "Find files" },
      g = { builtin.live_grep, "Find by grep" },
      b = { builtin.buffers, "Search in buffers" },
      h = { builtin.help_tags, "Search in help" },
    },
    g = {
      name = "+Git",
      b = { builtin.git_branches, "Find git branches" },
      s = { builtin.git_branches, "Find git stashes" },
    },
    h = {
      name = "+Harpoon",
      a = {
        function()
          harpoon:list():add()
        end,
        "Add file to Harpoon",
      },
      h = {
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        "Toggle Harpoon menu",
      },
      ["1"] = {
        function()
          harpoon:list():select(1)
        end,
        "Navigate to file 1",
      },
      ["2"] = {
        function()
          harpoon:list():select(2)
        end,
        "Navigate to file 2",
      },
      ["3"] = {
        function()
          harpoon:list():select(3)
        end,
        "Navigate to file 3",
      },
      ["4"] = {
        function()
          harpoon:list():select(4)
        end,
        "Navigate to file 4",
      },
      p = {
        function()
          harpoon:list():prev()
        end,
        "Previous buffer in Harpoon",
      },
      n = {
        function()
          harpoon:list():next()
        end,
        "Next buffer in Harpoon",
      },
    },
  },
  t = {
    name = "+Test",
    t = {
      function()
        neotest.run.run({})
      end,
      "Run nearest test",
    },
    f = {
      function()
        neotest.run.run({ vim.api.nvim_buf_get_name(0) })
      end,
      "Run tests in file",
    },
    o = {
      function()
        neotest.output.open()
      end,
      "Show test output",
    },
    p = {
      function()
        neotest.summary.toggle()
      end,
      "Show test summary",
    },
  },
  g = {
    name = "+Goto",
    b = { builtin.git_branches, "Branches" },
    d = { builtin.lsp_definitions, "Definitions" },
    D = { builtin.lsp_type_definitions, "Type definitions" },
    i = { builtin.lsp_implementations, "Implementations" },
    r = { builtin.lsp_references, "References" },
  },
})
