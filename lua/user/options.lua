local options = {
  autoindent = true,
  autoread = true,
  autowrite = true,
  backspace = { "indent", "eol", "nostop" },
  backup = false,
  backupcopy = "auto",
  breakindent = true,
  clipboard = "unnamedplus",
  colorcolumn = "+2",
  copyindent = true,
  cursorline = true,
  incsearch = true,
  infercase = true,
  linebreak = true,
  number = true,
  relativenumber = true,
  ruler = true,
  shiftround = true,
  showbreak = "> ",
  showmatch = true,
  showtabline = 1,
  smartcase = true,
  smarttab = true,
  splitbelow = true,
  splitright = true,
  switchbuf = { "usetab", "uselast", "vsplit" },
  wrapmargin = 1,
  tildeop = true,
  timeoutlen = 100,
  completeopt = { "menu", "menuone", "noselect" },
  tabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  softtabstop = 4


}


-- leader key mapping
vim.g.mapleader = ' '

-- diagnostic config
local config = {
  virtual_text = false,
  severity_sort = true,
}

vim.diagnostic.config(config)

for key, value in pairs(options) do
  vim.opt[key] = value
end
