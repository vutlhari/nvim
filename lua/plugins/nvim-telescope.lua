return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"gbrlsnchs/telescope-lsp-handlers.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local fb_actions = telescope.extensions.file_browser.actions
		telescope.setup {
			extensions = {
				file_browser = {
					mappings = {
						["i"] = {
							["<C-c>"] = fb_actions.create,
							["<C-d>"] = fb_actions.remove,
						},
					},
				},
			},
		}
		telescope.load_extension("file_browser")
		telescope.load_extension("media_files")

		local wk = require("which-key")

		local builtin = require("telescope.builtin")

		wk.add {
			{ "<leader>gg", builtin.builtin },
			{ "gb", builtin.git_branches },
			{ "gd", builtin.lsp_definitions },
			{ "gi", builtin.lsp_implementations },
			{ "gr", builtin.lsp_references },
			{ "<leader>d", builtin.diagnostics },
		}
	end,
}
