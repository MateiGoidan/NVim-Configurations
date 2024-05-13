return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local conf = require("ibl")
		conf.setup({})
	end,
}
