local options = {
	autoindent = true,
	autoread = true,
	autowrite = true,
	backspace = { "indent", "eol", "nostop" },
	backupcopy = "auto",
	backup = false,
	breakindent = true,
	clipboard = "unnamedplus",
	colorcolumn = "+2",
	completeopt = { "menu", "menuone", "noselect" },
	copyindent = true,
	cursorline = true,
	expandtab = true,
	guifont = "JetBrains Mono:h8",
	incsearch = true,
	infercase = true,
	linebreak = true,
	number = true,
	relativenumber = true,
	ruler = true,
	shiftround = true,
	shiftwidth = 4,
	showbreak = "> ",
	showmatch = true,
	showtabline = 1,
	smartcase = true,
	smarttab = true,
	softtabstop = 4,
	splitbelow = true,
	splitright = true,
	startofline = true,
	switchbuf = { "usetab", "uselast", "vsplit" },
	tabstop = 4,
	tildeop = true,
	timeoutlen = 100,
	wrapmargin = 1,
}

-- leader key mapping
vim.g.mapleader = " "

-- diagnostic config
local config = {
	virtual_text = false,
	severity_sort = true,
}

vim.diagnostic.config(config)

for key, value in pairs(options) do
	vim.opt[key] = value
end
