return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"html",
				"python",
				"sql",
				"markdown_inline",
				"markdown",
				"norg",
				"c",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },
			-- Install parsers synchronously (only applied to `ensure_installed`)
		})
	end,
}
