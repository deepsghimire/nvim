require("user.mappings.telescope")
require("user.mappings.diagnostics")
require("user.mappings.trouble")
require("user.mappings.snippets")
require("user.mappings.nvim-tree")
require("user.mappings.gitsigns")

vim.keymap.set({ "n" }, "<C-n>", function()
	vim.cmd.move(".+<CR>==")
end, { noremap = true, desc = "move line down" })

vim.keymap.set({ "n" }, "<C-p>", function()
	vim.cmd.move(".-2<CR>==")
end, { noremap = true, desc = "move live up" })

vim.keymap.set({ "v" }, "<C-n>", function()
	vim.cmd.move("'>+1<CR>gv=gv")
end, { noremap = true, desc = "move selection down" })

vim.keymap.set({ "v" }, "<C-p>", function()
	vim.cmd.move("'<-2<CR>gv=gv")
end, { noremap = true, desc = "move selection up" })
