vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("n", "<leader>ww", ":w<CR>")
vim.keymap.set("n", "<leader>wa", ":wa<CR>")
vim.keymap.set("n", "<leader>wq", ":w<CR> :q<CR>")
vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>cs", ":colo vscode<CR>")
vim.keymap.set("n", "<leader>rr", ":Roslyn restart<CR>")
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set(
	"n",
	"<leader>di", -- M is alt. Use <C-d> for ctrl.
	vim.diagnostic.open_float,
	{ desc = "Diagnostics : Current" }
)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("<leader>gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
		map("<leader>gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("<leader>gr", require("telescope.builtin").lsp_references, "Goto References")
		map("<leader>gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
		map("<leader>td", require("telescope.builtin").lsp_type_definitions, "Type Definitions")
		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
		map("<leader>if", vim.lsp.buf.format, "Indent File")
		map("<leader>hd", vim.lsp.buf.hover, "Hover Documentation")
		map("<leader>rn", vim.lsp.buf.rename, "Rename Across Project")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
	end,
})
