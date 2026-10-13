require("lualine").setup({
    options = {
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        icons_enabled = true,
    },

    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
            {
                "filename",
                path = 1,
                symbols = {
                    modified = " ●",
                    readonly = " 🔒",
                },
            },
        },
        lualine_x = {
            "diagnostics",
            "lsp_status",
            "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
})
