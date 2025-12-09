return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local ui = require("dapui")

		require("dapui").setup()
		require("nvim-dap-virtual-text").setup({})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			ui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			ui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			ui.close()
		end

		dap.configurations = {
			cs = { -- untested
				{
					type = "coreclr",
					name = "launch - coreclr",
					request = "launch",
					justMyCode = "false",
					program = function()
						return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
					end,
				},
				{
					type = "coreclr",
					name = "attach - coreclr",
					request = "attach",
					justMyCode = "false",
					processId = require("dap.utils").pick_process,
				},
			},
		}

		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>bc", dap.clear_breakpoints)

		vim.cmd("hi DapBreakpointColor guifg=#e11d48")

		vim.fn.sign_define("DapBreakpoint", {
			text = "",
			texthl = "DapBreakpointColor",
			numhl = "",
			linehl = ""
		})

		vim.keymap.set("n", "<leader>?", function()
			ui.eval(nil, { enter = true })
		end)

		-- vim.keymap("n", "<F1>")
	end,
}
