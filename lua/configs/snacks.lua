local snacks = require("snacks")

snacks.setup({
    bigfile = { enabled = true },
    dashboard = {
        enabled = true,
        preset = {
            keys = {
                { icon = "󰍉 ", key = "f", desc = "Find File", action = ":Telescope find_files" },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
                { icon = "q ", key = "q", desc = "Quit", action = ":qa" },
            },
        },
        sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
            { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
        },
    },
    indent = {
        enabled = true,
        animate = { enabled = false },
    },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },

    picker = { enabled = false },
})
