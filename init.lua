require("options")
require("pack")
require("configs/small-configs")
require("configs/treesitter")
require("configs/telescope")
require("configs/harpoon")
require("configs/blink")
require("configs/lualine")
require("configs/snacks")
require("configs/markdown")
require("configs/image")
require("lsp/lua_ls")
require("keymaps")

vim.cmd.colorscheme("catppuccin-nvim")

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        require("image").clear()
    end,
})

vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*.md",
    callback = function()
        local ok, image = pcall(require, "image")
        if ok then
            image.clear()
        end
    end,
})

vim.lsp.enable({
    "lua_ls",
    "vtsls",
    "html",
    "jsonls",
    "cssls",
    "roslyn",
    "tailwindcss",
    "yamlls",
    "zls",
})
