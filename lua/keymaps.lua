vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local wk = require("which-key")
local builtin = require("telescope.builtin")
local neotest = require("neotest")

local testNearest = function()
	neotest.run.run {}
end

local testFile = function()
	neotest.run.run { vim.api.nvim_buf_get_name(0) }
end

local testOutput = function()
	neotest.output.open()
end

wk.add {
	{ "<leader>]", ":bn<cr>" },
	{ "<leader>[", ":bp<cr>" },
	{ "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", mode = "n" },
	{ "<leader>lg", "<cmd>LazyGit<cr>", mode = "n" },
	{ "<leader>bd", ":bd<cr>" },
	{ "<leader>fs", builtin.current_buffer_fuzzy_find, name = "Find in current buffer" },
	{ "<leader>ff", builtin.find_files, name = "Find files" },
	{ "<leader>fg", builtin.live_grep, name = "Find by grep" },
	{ "<leader>fb", builtin.buffers, name = "Search in buffers" },
	{ "<leader>fh", builtin.help_tags, name = "Search in help" },
	{ "<leader>tt", testNearest },
	{ "<leader>tf", testFile },
	{ "<leader>to", testOutput },
}
