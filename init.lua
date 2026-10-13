require("options")
require("pack")
require("configs/small-configs")
require("configs/treesitter")
require("configs/telescope")
require("configs/harpoon")
require("configs/blink")
require("configs/lualine")
require("configs/snacks")
require("lsp/lua_ls")
require("keymaps")

vim.cmd.colorscheme("catppuccin-nvim")

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
