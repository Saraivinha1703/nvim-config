vim.g.mapleader = " "
require("config.lazy")
require("config.keybinds")
require("config.options")
require("lsp.lua_ls")
require("lsp.clangd")
require("lsp.roslyn")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "%__virtual.cs$" },
	},
})
require("ibl").setup({})
require("lualine").setup({})

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "lsp", "indent" }
	end,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("yamlls")
vim.lsp.enable("roslyn")

vim.diagnostic.enable()
vim.lsp.diagnostic.enable = true
