return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
			vim.keymap.set("n", "<leader>cm", ":Mason<CR>", {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			-- lspconfig.hls.setup({})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			-- lspconfig.tsserver.setup({})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			-- lspconfig.rust_analyzer.setup({})

			-- Look on the github page to configure more keymaps!
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
		end,
	},
	{
		"hinell/lsp-timeout.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			vim.g.lspTimeoutConfig = {
				stopTimeout = 1000 * 60 * 5, -- ms, timeout before stopping all LSPs
				startTimeout = 1000, -- ms, timeout before restart
				silent = false,
			}
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "v1.0.0",
		config = function()
			local fidgetconfig = require("fidget")
			fidgetconfig.setup()
		end,
	},
	{
		-- For the Java LSP
		"mfussenegger/nvim-jdtls",
	},
	{
		-- For the Python LSP
		"HallerPatrick/py_lsp.nvim",
	},
}
