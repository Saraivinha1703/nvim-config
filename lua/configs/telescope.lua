local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        prompt_prefix = " 󰍉 ",
        selection_caret = "➜ ",
        sorting_strategy = "ascending",

        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
        },

        file_ignore_patterns = {
            "node_modules",
            ".git/",
            "dist/",
            "build/",
            "bin/",
            "obj/",
        },
    },
})

-- Keymaps
vim.keymap.set("n", "<leader>ff", builtin.find_files, {
    desc = "Find files",
})

vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
    desc = "Search text",
})

vim.keymap.set("n", "<leader>fb", builtin.buffers, {
    desc = "Find buffers",
})

vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
    desc = "Search help",
})

vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {
    desc = "Recent files",
})
