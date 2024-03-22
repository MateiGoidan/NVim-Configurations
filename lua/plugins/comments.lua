return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		local conf = require("Comment")
		conf.setup({
			toggler = {
				-- Line-comment toggle keymap
				line = "<leader>gc",
				-- Block-comment toggle keymap
				block = "<leader>gb",
			},
			opleader = {
				-- Line-comment keymap
				line = "gc",
				-- Block-comment keymap
				block = "gb",
			},
		})
	end,
}
