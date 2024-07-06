local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

local opt = vim.opt

vim.cmd([[
    filetype plugin indent on
    syntax on
]])

-- line number
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.swapfile = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- hightligth active line
opt.cursorline = true

-- true color terminal settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- enable specific highlights in debug mode

-- backspace settings
opt.backspace = "indent,eol,start"
-- enable native clipboard instead of vim default clipboard behavior
-- opt.clipboard:append "unnamedplus"
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })

-- split windows
opt.splitright = true
opt.splitbelow = true

-- set dash as normal letter instead of divide behavior
opt.iskeyword:append("-")

opt.showmode = false

-- auto completion menu height
vim.opt.pumheight = 10

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<leader><Tab>", ":bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader><S-Tab>", ":bp<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename variable" })

require("lazy").setup("plugins")

vim.cmd.colorscheme("catppuccin-mocha")
