return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")

			require("dapui").setup()

			local dapui = require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local config = {
				cmd = { "~/.local/share/nvim/mason/bin/jdtls" },
				root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
				on_attach = function(client, bufnr)
					require("jdtls").setup_dap({ hotcodereplace = "auto" })
					require("jdtls.dap").setup_dap_main_class_configs()
					require("jdtls").add_commands()
				end,
				init_options = {
					bundles = {
						-- Bundle Java debug adapter
            "~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.50.0.jar"
						-- TODO Bundle java-test
					},
				},
			}
			require("jdtls").start_or_attach(config)

			-- Setup dap java configuration
			local dap = require("dap")
			dap.configurations.java = {
				{
					javaExec = "java",
					request = "launch",
					type = "java",
				},
				{
					type = "java",
					request = "attach",
					name = "Debug (Attach) - Remote",
					hostName = "127.0.0.1",
					port = 5005,
				},
			}
		end,
	},
}
