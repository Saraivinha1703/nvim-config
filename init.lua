vim.g.mapleader = " "

require("config.lazy")
require("config.keybinds")
require("config.options")
require("lsp.lua_ls")
require("lsp.clangd")
require("lsp.roslyn")
require("lsp.vtsls").setup(require("mason-registry"))

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "%__virtual.cs$", "%__virtual.html$" },
	},
})

require("ibl").setup({})
require("lualine").setup({})

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "lsp", "indent" }
	end,
})

vim.lsp.enable({ "html", "lua_ls", "clangd", "yamlls", "roslyn", "vtsls" })

vim.diagnostic.enable()
vim.lsp.diagnostic.enable = true
