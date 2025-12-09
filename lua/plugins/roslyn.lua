return {
	"seblyng/roslyn.nvim",
	opts = {
		filewatching = "roslyn",
		broad_search = true,
	},
	dependencies = {
		{
			"tris203/rzls.nvim",
			config = true,
		},
	},
	init = function()
            -- We add the Razor file types before the plugin loads.
            vim.filetype.add({
                extension = {
                    razor = "razor",
                    cshtml = "razor",
                },
            })
        end,
}
