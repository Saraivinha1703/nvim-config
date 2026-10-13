local blink = require("blink.cmp")

blink.setup({
    keymap = {
        preset = "default",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-d>"] = { "show_documentation", "hide_documentation", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono"
    },

    completion = {
        trigger = {
            show_on_keyword = false,
            show_on_trigger_character = false
        },
        list = {
            selection = {
                preselect = false,
                auto_insert = false,
            }
        },
        documentation = {
            auto_show = false
        },
        ghost_text = {
            enabled = true,
            show_with_selection = true
        }
    },

    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer"
        }
    },

    fuzzy = {
        implementation = "rust"
    }
})
