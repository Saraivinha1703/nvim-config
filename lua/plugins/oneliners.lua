return {
	{
		"neovim/nvim-lspconfig",
	},
	{ -- Auto close brackets, braces and quotes
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"davidmh/mdx.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "BufEnter *.mdx",
	},
	{ -- Git plugin
		"tpope/vim-fugitive",
	},
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
	},
	{
		"lukas-reineke/virt-column.nvim",
		config = function()
			require("virt-column").setup({
				virtcolumn = "150",
				exclude = {
					filetypes = {
						"lspinfo",
						"packer",
						"checkhealth",
						"help",
						"man",
						"gitcommit",
						"TelescopePompt",
						"TelescopeResults",
						"oil",
					},
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 200,
					virt_text_priority = 1000,
				},
			})
			vim.cmd("set statusline+=%{get(b:,'gitsigns_status','')}")
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
