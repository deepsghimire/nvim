local opts = { noremap = true, silent = true }

function add(tbl, tbl2)
  return vim.tbl_extend('force', tbl, tbl2)

end

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, add(opts, { desc = "Open diagnostic" }))
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, add(opts, { desc = "Goto previous diagnostic" }))
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, add(opts, { desc = "Goto next diagnostic" }))
vim.keymap.set('n', '<space>q', "<cmd>TroubleToggle document_diagnostics<cr>", add(opts, { desc = "Open location list" }))
