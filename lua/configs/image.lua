require("image").setup({
    backend = "kitty",

    processor = "magick_cli",

    window_overlap_clear_enabled = true,
    tmux_show_only_in_active_window = true,
    clear_in_insert_mode = false,

    integrations = {
        markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = false,
            only_render_image_at_cursor = false,
            only_render_image_at_cursor_mode = "inline",
        },
    },

    max_width = 80,
    max_height = 20,
})
