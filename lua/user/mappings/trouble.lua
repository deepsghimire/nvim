
local wk = require('which-key')


vim.keymap.set("n", "<leader>qq", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>qw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>qd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>ql", "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>qf", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { silent = true, noremap = true ,desc = "lsp references"}
)

opts = {
    prefix="<leader>"
}

mapping_doc = {
    q = {
        name = "quickfix list",
        q = "Toggle",
        w = "Workspace diagnostics",
        d = "Document diagnostics",
        l = "location list",
        f = "quickfix list",
    }
}

wk.register(mapping_doc,opts)
