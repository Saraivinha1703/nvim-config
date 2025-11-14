return {
	{ -- Auto close brackets, braces and quotes
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{ -- Git plugin
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
			vim.cmd "set statusline+=%{get(b:,'gitsigns_status','')}"
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
}
