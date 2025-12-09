return {
	{
		"catppuccin/nvim",
		priority = 100,
		config = function()
			vim.cmd.colorscheme("catppuccin")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true })
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true })
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true })
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			local c = require("vscode.colors").get_colors()
			require("vscode").setup({
				transparent = true,
				italic_comments = true,
				group_overrides = {
					["@lsp.type.struct"] = { fg = "#83b670" },
					["@lsp.type.interface"] = { fg = c.vscLightGreen },
					["@lsp.type.typeParameter"] = { fg = c.vscLightGreen },
					["@lsp.type.namespace"] = { fg = c.vscFront },
					["@lsp.type.property"] = { fg = c.vscFront },
					["@lsp.type.field.cs"] = { fg = c.vscFront },
				},
			})
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
	},
	{
		"sainnhe/everforest",
		priority = 1000,
		lazy = false,
		config = function()
			vim.g.everforest_enable_italic = true
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
