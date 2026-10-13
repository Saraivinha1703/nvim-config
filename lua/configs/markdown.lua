require("render-markdown").setup({
    render_modes = { "n", "c", "t" },

    heading = {
        enabled = true,
        sign = false,
        icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
    },

    code = {
        enabled = true,
        style = "full",
        border = "thin",
    },

    checkbox = { enabled = true },

    latex = { enabled = false },

    dash = { enabled = true },

    image = {
        enabled = false,
    },
})

require("render_latex").setup({
    render = {
        preset = "match_text", -- "compact" or "presentation"
        inline = "conceal", -- "content", "highlight", or false
        inline_symbols = true,
        live_preview = true,
        hide_on_cmdline = false,
    },
})
