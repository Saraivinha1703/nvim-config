local M = {}

M.ts_plugins = {
	"@mdx-js/typescript-plugin",
}

M.plugin_paths = {}

---@param name string
local function install_plugin(name)
	local root = vim.fs.joinpath(vim.fn.expand("$MASON"), "packages", "vtsls")
	local path = vim.fs.joinpath(root, "node_modules", name)

	if vim.fn.isdirectory(path) ~= 0 then
		return path
	end

	local id = vim.fn.jobstart({ "npm", "i", name }, { cwd = root })

	print(string.format("Installing %s...", name))
	vim.fn.jobwait({ id })

	return path
end

function M.setup(registry)
	local pkg = registry.get_package("vtsls")

	if not pkg:is_installed() then
		pkg:install({ "vtsls" }, function()
			for _, name in ipairs(M.ts_plugins) do
				M.ts_plugins[name] = install_plugin(name)
			end
		end)
	end

	for _, name in ipairs(M.ts_plugins) do
		M.plugin_paths[name] = install_plugin(name)
	end

	vim.filetype.add({
		extension = {
			mdx = "typescriptreact",
		},
	})

	vim.lsp.config("vtsls", {
		settings = {
			vtsls = {
				tsserver = {
					globalPlugins = {
						{
							name = "@mdx-js/typescript-plugin",
							location = M.ts_plugins["@mdx-js/typescript-plugin"],
							enableForWorkspaceTypeScriptVersions = true,
						},
					},
				},
			},
		},
	})

	vim.lsp.enable("vtsls")
end

return M
