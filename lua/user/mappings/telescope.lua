local builtin = require('telescope.builtin')
local wk = require('which-key');

local function themed(fn)
  return function()
    return fn(require('telescope.themes').get_dropdown())
  end
end

wk.register({ f = { "find things" } }, { prefix = "<leader>" })
vim.keymap.set('n', '<leader>ff', themed(builtin.find_files), { desc = "find files" })
vim.keymap.set('n', '<leader>fg', themed(builtin.live_grep), { desc = "live grep" })
vim.keymap.set('n', '<leader>fb', themed(builtin.buffers), { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fh', themed(builtin.help_tags), { desc = "find help" })
vim.keymap.set('n', '<leader>fc', themed(builtin.commands), { desc = "available plugin/user commands" })
vim.keymap.set('n', '<leader>fm', themed(builtin.commands), { desc = "man pages" })
vim.keymap.set('n', '<leader>fk', themed(builtin.keymaps), { desc = "find keymaps" })
vim.keymap.set('n', '<leader>c', themed(builtin.colorscheme), { desc = "colorschemes" })
