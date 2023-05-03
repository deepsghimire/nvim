local api = require("nvim-tree.api")
local wk = require("which-key")

-- wk.register({ n = { "File explorer" }, { prefix = "<leader>" } })

vim.keymap.set("n", "<leader>o", function()
	api.tree.toggle()
end,{desc = "toogle tree"})
