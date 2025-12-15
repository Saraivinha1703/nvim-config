vim.o.number = true
vim.o.cursorline = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.list = false
vim.o.listchars = "tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.wrap = false
vim.o.winborder = "rounded"
vim.o.foldcolumn = "auto"
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.fillchars = "foldopen:,foldclose:,eob: ,"
vim.o.foldlevelstart = 99

vim.diagnostic.config({
	virtual_text = {
		source = false,
		severity = {
			vim.diagnostic.severity.ERROR,
			vim.diagnostic.severity.WARN,
			vim.diagnostic.severity.INFO,
			vim.diagnostic.severity.HINT,
		},
	},
	severity_sort = true,
	update_in_insert = true,
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
	float = {
		border = "rounded",
	},
	jump = {
		float = true,
		wrap = true,
		severity = {
			vim.diagnostic.severity.ERROR,
			vim.diagnostic.severity.WARN,
		},
	},
})
