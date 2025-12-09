return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			relculright = true,
			bt_ignore = { "terminal" },
			ft_ignore = { "oil" },
			segments = {
				{
					text = { builtin.foldfunc, " " },
					sign = { auto = "  " },
					click = "v:lua.ScFa",
				},
				{
					sign = { namespace = { "diagnostic" }, maxwidth = 1, colwidth = 1, auto = " ", wrap = true },
					click = "v:lua.ScSa",
				},
				{
					text = { builtin.lnumfunc, " " },
					click = "v:lua.ScLa",
				},
				{
					sign = { namespace = { "gitsigns" }, maxwidth = 1, auto = true },
					click = "v:lua.ScSa",
				},
				{
					sign = { name = { ".*" }, maxwidth = 1, auto = " ", wrap = true },
					click = "v:lua.ScSa",
				},
			},
		})
	end,
}
