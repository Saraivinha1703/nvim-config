return {
	{
		"catppuccin/nvim",
		priority = 100,
		config = function()
			vim.cmd.colorscheme("catppuccin")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		end,
	},
}
