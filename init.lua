vim.g.mapleader = " "

require("config.lazy")
require("config.keybinds")
require("config.options")
require("lsp.emmylua_ls")
require("lsp.clangd")
require("lsp.roslyn")
require("lsp.vtsls").setup(require("mason-registry"))

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
	callback = function(args)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = args.buf,
			callback = function()
				vim.lsp.buf.format({ async = false, id = args.data.client_id })
			end,
		})
	end,
})

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
	provider_selector = function(bufnr, filetype, buftype)
		return { "lsp", "indent" }
	end,
})

vim.lsp.enable({ "html", "emmylua_ls", "clangd", "yamlls", "roslyn", "vtsls", "jsonls" })

vim.diagnostic.enable()
