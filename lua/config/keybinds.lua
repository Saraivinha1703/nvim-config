vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("n", "<leader>ww", ":w<CR>")
vim.keymap.set("n", "<leader>wa", ":wa<CR>")
vim.keymap.set("n", "<leader>wq", ":w<CR> :q<CR>")
vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover)

vim.keymap.set(
	"n",
	"<leader>d", -- M is alt. Use <C-d> for ctrl.
	vim.diagnostic.open_float,
	{ desc = "Diagnostics : Current" }
)
