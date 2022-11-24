require("user.mappings.telescope")
require("user.mappings.diagnostics")
require("user.mappings.trouble")
require("user.mappings.snippets")



-- for ssr
vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end)
