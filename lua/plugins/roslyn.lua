return {
	{
		"seblyng/roslyn.nvim",
		lazy = false,
		dependencies = {
			{
				"tris203/rzls.nvim",
				config = true,
			},
		},
		opts = {
			filewatching = "roslyn",
			broad_search = true,
		},
		config = function()
			local mason_registry = require("mason-registry")

			local rzls_path = vim.fn.expand("$MASON/packages/rzls/libexec")
			local cmd = {
				"roslyn",
				"--stdio",
				"--logLevel=Information",
				"--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
				"--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
				"--razorDesignTimePath="
					.. vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
				"--extension",
				vim.fs.joinpath(rzls_path, "RazorExtension", "Microsoft.VisualStudioCode.RazorExtension.dll"),
			}

			vim.lsp.config("roslyn", {
				cmd = cmd,
				handlers = require("rzls.roslyn_handlers"),
				settings = {
					["csharp|background_analysis"] = {
						dotnet_analyzer_diagnostics_scope = "fullSolution",
						dotnet_compiler_diagnostics_scope = "fullSolution",
					},
					["csharp|completion"] = {
						dotnet_show_completion_items_from_unimported_namespaces = true,
						dotnet_show_name_completion_suggestions = true,
					},
					["csharp|symbol_search"] = {
						dotnet_search_reference_assemblies = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
					["csharp|formatting"] = {
						dotnet_organize_imports_on_format = true,
					},
				},
			})
			vim.lsp.enable("roslyn")
		end,
		init = function()
			-- We add the Razor file types before the plugin loads.
			vim.filetype.add({
				extension = {
					razor = "razor",
				},
			})
		end,
	},
}
