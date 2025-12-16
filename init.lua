vim.g.mapleader = " "

require("config.lazy")
require("config.keybinds")
require("config.options")
require("lsp.emmylua_ls")
require("lsp.clangd")
require("lsp.roslyn")
require("lsp.vtsls").setup(require("mason-registry"))

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "%__virtual.cs$", "%__virtual.html$" },
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

require("ibl").setup({})
require("lualine").setup({})

require("ufo").setup({
	provider_selector = function()
		return { "lsp", "indent" }
	end,
})

vim.lsp.enable({
	"tailwindcss",
	"cssls",
	"html",
	"emmylua_ls",
	"clangd",
	"yamlls",
	"roslyn",
	"vtsls",
	"jsonls",
	"mdx_analyzer",
})

vim.diagnostic.enable()
