-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- for conciseness
local keymap = vim.keymap
local api = vim.api

-- getting out of the buffer
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Exit buffer" })

-- some file changes to do in normal mode
api.nvim_set_keymap("n", "E", "$", { noremap = false, desc = "Go to end of line" })
api.nvim_set_keymap("n", "B", "^", { noremap = false, desc = "Go to begining of line" })

-- moving around in visual
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move command visual up" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move command visual down" })

-- moving around normal
keymap.set("n", "J", "mzJ`z", { desc = "Append current line with space" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page jump down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page jump up" })
keymap.set("n", "n", "nzzzv", { desc = "Search terms next" })
keymap.set("n", "N", "Nzzzv", { desc = "Search terms back" })

-- remap for better copy and pasting with clipboard
-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]], { desc = "Delete highlighted word but keep prior word" })

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to sys clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to end of line to sys clipboard" })

keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to sys clipboard" })

-- to avoid hell
keymap.set("n", "Q", "<nop>")

-- quick fix list
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Quick fix next" })
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Quick fix previous" })
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Location list next" })
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Location list previous" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tn", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>ss", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Move window left" })
keymap.set("n", "<leader>sj", "<C-w>k", { desc = "Move window down" })
keymap.set("n", "<leader>sk", "<C-w>j", { desc = "Move window up" })
keymap.set("n", "<leader>sl", "<C-w>l", { desc = "Move window right" })
keymap.set("n", "<leader>s<", "<C-w>5<", { desc = "Resize window left" })
keymap.set("n", "<leader>s-", "<C-w>5-", { desc = "Resize window down" })
keymap.set("n", "<leader>s+", "<C-w>5+", { desc = "Resize window up" })
keymap.set("n", "<leader>s>", "<C-w>5>", { desc = "Resize window right" })

-- additional keymaps
keymap.set(
	"n",
	"<leader>ps",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word on cursor" }
)
keymap.set("n", "<leader>xf", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Makes certain files exec" })

keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end, { desc = "Source file" })

-- undotree stuff
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle on undotree" })

-- noice stuff
api.nvim_set_keymap("n", "<leader>nn", ":Noice dismiss<CR>", { noremap = true })

keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>", { silent = true, noremap = true })

-- todo stuff
vim.keymap.set("n", "<leader>o]", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "<leader>o[", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- zenmode stuff
keymap.set("n", "<leader>zm", vim.cmd.ZenMode, { desc = "Momement of zen" })
