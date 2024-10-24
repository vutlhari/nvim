return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			ignore_focus = { "lspinfo" },
			always_divide_middle = true,
			globalstatus = false,
			disabled_filetypes = {
				packer = {},
				NvimTree = {},
				statusline = {},
				winbar = {},
			},
			extensions = {
				"toggleterm",
				"nvim-tree",
				"fzf",
				{
					sections = { lualine_a = { "filetype" } },
					filetypes = { "lspsagaoutline" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diagnostics" },
				lualine_c = {
					"filename",
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},
}
