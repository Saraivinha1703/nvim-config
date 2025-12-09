vim.o.number = true
vim.o.cursorline = true
vim.o.relativenumber = true
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
		source = false, -- omit LSP name to save space
		-- virt_text_pos = "eol", -- display right beside the line
		severity = {
			-- these levels should be familiar. Keep what's needed.
			vim.diagnostic.severity.ERROR,
			vim.diagnostic.severity.WARN,
			vim.diagnostic.severity.INFO,
			vim.diagnostic.severity.HINT,
		},
	},
	severity_sort = true, -- prioritize errors
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
		float = true, -- open float after jump
		wrap = true, -- wrap to start at the end of the file
		severity = {
			-- I choose to jump only to Errors and Warnings
			vim.diagnostic.severity.ERROR,
			vim.diagnostic.severity.WARN,
		},
	},
})
