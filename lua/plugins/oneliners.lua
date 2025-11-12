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
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
}
