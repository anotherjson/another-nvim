return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		local keymap = vim.keymap

		harpoon.setup(
			keymap.set("n", "<leader>pm", function()
				harpoon:list():append()
			end, { desc = "Mark file with harpoon" }),
			keymap.set("n", "<leader>ph", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Go to harpoon quick menu" }),
			keymap.set("n", "<leader>pj", function()
				harpoon:list():select(1)
			end, { desc = "Go to harpoon mark 1" }),
			keymap.set("n", "<leader>pk", function()
				harpoon:list():select(2)
			end, { desc = "Go to harpoon mark 2" }),
			keymap.set("n", "<leader>pl", function()
				harpoon:list():select(1)
			end, { desc = "Go to harpoon mark 3" }),
			keymap.set("n", "<leader>p;", function()
				harpoon:list():select(4)
			end, { desc = "Go to harpoon mark 4" })
		)
	end,
}
