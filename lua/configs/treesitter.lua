local treesitter = require("nvim-treesitter")

treesitter.setup({})

treesitter.install({
    "lua",
    "c_sharp",
    "typescript",
    "tsx",
    "javascript",
    "json",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "latex",
    "zig",
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})

