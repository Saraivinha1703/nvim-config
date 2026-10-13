vim.keymap.set("n", "<leader>fe", "<CMD>Oil<CR>", {
    desc = "Open parent directory"
})

vim.keymap.set("n", "<leader>ww", "<CMD>w<CR>", {
    desc = "Write file"
})

vim.keymap.set("n", "<leader>ws", "<CMD>w<CR><CMD>so<CR>", {
    desc = "Write and source file"
})

vim.keymap.set("i", "jk", "<ESC>")

-- personal keymaps
vim.keymap.set("n", "dIB", "f{diB")
vim.keymap.set("n", "cIB", "f{ciB")
vim.keymap.set("n", "dIb", "f(dib")
vim.keymap.set("n", "cIb", "f(cib")
vim.keymap.set("n", 'dI"', 'f"di"')
vim.keymap.set("n", 'cI"', 'f"ci"')
vim.keymap.set("n", "dI<", "f<di<")
vim.keymap.set("n", "cI<", "f<ci<")
vim.keymap.set("n", "dI[", "f[di[")
vim.keymap.set("n", "cI[", "f[ci[")

vim.keymap.set("n", "dAB", "f{daB")
vim.keymap.set("n", "cAB", "f{caB")
vim.keymap.set("n", "dAb", "f(dab")
vim.keymap.set("n", "cAb", "f(cab")
vim.keymap.set("n", 'dA"', 'f"da"')
vim.keymap.set("n", 'cA"', 'f"ca"')
vim.keymap.set("n", "dA<", "f<da<")
vim.keymap.set("n", "cA<", "f<ca<")
vim.keymap.set("n", "dA[", "f[da[")
vim.keymap.set("n", "cA[", "f[ca[")

-- DIAGNOSTICS
vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { desc = "Diagnostics : Current" })
vim.keymap.set("n", "<leader>dl", function() require("telescope.builtin").diagnostics({ bufnr = nil }) end,
    { desc = "Diagnostic list" })

-- GITSIGNS
vim.keymap.set("n", "<leader>gc", "<cmd>Gitsigns diffthis<CR>",
    { desc = "Difference between current and commit" })
vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage a hunk" })
vim.keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset the staged hunk" })

-- SNACKS
local snacks = require("snacks")

-- Notifications
vim.keymap.set("n", "<leader>nh", function() snacks.notifier.show_history() end,
    { desc = "Notification History" })

-- Buffer & File Quick Actions (Quickfile / Bigfile handle automatically in background)
vim.keymap.set("n", "<leader>bd", function() snacks.bufdelete() end,
    { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", function() snacks.bufdelete.other() end,
    { desc = "Delete Other Buffers" })

-- color themes
vim.keymap.set("n", "<leader>uC", function() snacks.picker.colorschemes() end, { desc = "Change color theme" })

-- Dashboard
vim.keymap.set("n", "<leader>db", function() snacks.dashboard() end,
    { desc = "Open Dashboard" })

-- Input / Renaming
vim.keymap.set("n", "<leader>rf", function() snacks.rename.rename_file() end,
    { desc = "Rename Current File" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol (Project-wide)" })

-- Word Navigation & Highlighting (Snacks Words)
-- Jump between occurrences of the word under cursor
vim.keymap.set({ "n", "t" }, ">>", function() snacks.words.jump(1, true) end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "<<", function() snacks.words.jump(-1, true) end, { desc = "Prev Reference" })

-- Git Integration (Bonus built-in utilities)
vim.keymap.set("n", "<leader>gb", function() snacks.git.blame_line() end, { desc = "Git Blame Line" })
vim.keymap.set("n", "<leader>gB", function() snacks.gitbrowse() end, { desc = "Open Git Repo in Browser" })
vim.keymap.set("n", "<leader>gg", function() snacks.lazygit() end, { desc = "Open Lazygit" })

-- Scratch Buffer (Great for temporary testing or notes)
vim.keymap.set("n", "<leader>.", function() snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<leader>S", function() snacks.scratch.select() end, { desc = "Select Scratch Buffer" })

-- Zen
vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>Z", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })

-- LSP
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
        map("<leader>wS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
        map("<leader>fm", function()
            require("conform").format({ lsp_fallback = true })
        end, "Format File")
        map("<leader>hd", vim.lsp.buf.hover, "Hover Documentation")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    end,
})

vim.keymap.set("n", "<leader>cs", function() vim.cmd.colorscheme("vscode") end,
    { desc = "Switches to vscode theme" })
