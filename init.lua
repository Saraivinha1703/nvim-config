require("config.keybinds")
require("config.options")
require("config.lazy")
require("lsp.lua_ls")

require("ibl").setup({})
require("lualine").setup({})

vim.lsp.enable("lua_ls")
