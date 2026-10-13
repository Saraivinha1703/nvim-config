require("nvim-autopairs").setup({
    check_ts = false,
    enable_check_bracket_line = true
})

local npairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")
npairs.add_rules({
    rule("<", ">", {})
})

require("nvim-web-devicons").setup()

require("gitsigns").setup()

require("oil").setup({
    columns = {
        "icon"
    },
    view_options = {
        show_hidden = true
    },
    float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
        }
    }
})

require("mason").setup({
    ui = {
        border = "rounded"
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "vtsls",
        "html",
        "cssls",
        "roslyn_ls",
        "yamlls",
        "jsonls",
        "tailwindcss",
        "zls"
    }
})

require("fidget").setup({
    notification = {
        window = {
            winblend = 0,
        },
    },
})

local c = require("vscode.colors").get_colors()
require("vscode").setup({
    style = "dark",
    transparent = true,
    -- Enable italic comment
    italic_comments = true,
    -- Enable italic inlay type hints
    italic_inlayhints = true,
    -- Underline `@markup.link.*` variants
    underline_links = true,
    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
    -- Apply theme colors to terminal
    terminal_colors = true,
    group_overrides = {
        ["@lsp.type.struct"] = { fg = "#83b670" },
        ["@lsp.type.interface"] = { fg = c.vscLightGreen },
        ["@lsp.type.typeParameter"] = { fg = c.vscLightGreen },
        ["@lsp.type.namespace"] = { fg = c.vscFront },
        ["@lsp.type.property"] = { fg = c.vscFront },
        ["@lsp.type.field.cs"] = { fg = c.vscFront },
    },
})

require("catppuccin").setup({
    flavor = "mocha",
    transparent_background = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = true,
    }
})
