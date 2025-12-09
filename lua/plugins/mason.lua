return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{
			"mason-org/mason.nvim",
			opts = {
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
				ui = {
					backdrop = 100,
				},
				ensure_installed = {
					"lua-language-server",
					"yaml-language-server",

					"xmlformatter",
					"csharpier",
					"prettier",

					"stylua",
					"html-lsp",
					"css-lsp",
					"tailwindcss",
					"eslint-lsp",
					"typescript-language-server",
					"json-lsp",

					"roslyn",
					"rzls",

					"clangd",
					"clang-format",
					"codelldb",
				},
			},
			cmd = "Mason",
		},
	},
}
