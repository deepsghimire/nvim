local ls = require("luasnip")

vim.keymap.set({ 'n', 's', 'i' }, "<c-k>", function()
  if ls.expand_or_jumpable then
    ls.expand_or_jump()
  end
end, { silent = true, desc = "expand snippet" })

vim.keymap.set({ 'n', 's', 'i' }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true, desc = "Jump previous" })

vim.keymap.set({ 'n', 'i' }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice()
  end
end, { silent = true, desc = "Change choice" })


vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/user/snippets.lua<cr>",
  { desc = "source the snippet file" })
