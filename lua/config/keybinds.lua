vim.o.clipboard = "unnamedplus"
-- vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("n", "<leader>ww", ":w<CR>")
vim.keymap.set("n", "<leader>wa", ":wa<CR>")
vim.keymap.set("n", "<leader>wq", ":w<CR> :q<CR>")
vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>cs", ":colo vscode<CR>")
vim.keymap.set("n", "<leader>rr", "<cmd>Roslyn restart<CR>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>fe", "<cmd>Oil<CR>")
vim.keymap.set("t", "<C-M-t>", function()
	Snacks.terminal()
end)
vim.keymap.set("t", "<C-w>h", "[[<cmd>wincmd h<CR>]]", { buffer = 0 })
vim.keymap.set("t", "<C-w>j", "[[<c<cmd>wincmd j<CR>]]", { buffer = 0 })
vim.keymap.set("t", "<C-w>k", "[[<c<cmd>wincmd k<CR>]]", { buffer = 0 })
vim.keymap.set("t", "<C-w>l", "[[<c<cmd>wincmd l<CR>]]", { buffer = 0 })
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "<leader>pf", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end)

vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { desc = "Diagnostics : Current" })

vim.keymap.set("n", "<leader>gc", "<cmd>Gitsigns diffthis<CR>")
vim.keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>hu", "<cmd>echo expand('%:p') | Git reset --patch<CR>")

vim.keymap.set("n", "<leader>mp", "<cmd>Markview splitToggle<CR>")

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
		map("<leader>fi", function()
			vim.lsp.buf.format({ async = false, id = event.data.client_id })
		end, "File Indent")
		map("<leader>hd", vim.lsp.buf.hover, "Hover Documentation")
		map("<leader>rn", vim.lsp.buf.rename, "Rename Across Project")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
	end,
})
