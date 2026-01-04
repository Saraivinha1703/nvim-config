return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		async = true,
		formatters_by_ft = {
			cs = { "csharpier" },
			csproj = { "csharpier" },
			xml = { "csharpier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
		},
		formatters = {
			csharpier = {
				command = "csharpier",
				args = {
					"format",
					"--write-stdout",
					"--config-path",
					"/home/saraivinha/.config/nvim/.csharpierrc.json",
				},
				to_stdin = true,
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
