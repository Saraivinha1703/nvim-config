return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = { enable = true },
			autotage = { enable = true },
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"lua",
				"yaml",
				"javascript",
				"typescript",
				"tsx",
				"css",
				"html",
				"c_sharp",
				"razor",
				"c",
			},
		})
	end,
}
