(local options {
	; When on Vim will change the current working directory whenever you
	; open a file switch buffers, delete a buffer or open/close a window.
    :autochdir   false
	; Copy indent from current line when starting a new line
	:autoindent   true
	; When a file has been detected to have been changed outside of Vim and
	; it has not been changed inside of Vim automatically read it again.
	:autoread   true
	; Write the contents of the file if it has been modified, on each
	; `:next` `:rewind`, `:last`, `:first`, `:previous`, `:stop`,
	; 	`:suspend` `:tag`, `:!`, `:make`, CTRL-] and CTRL-^ command; and when
	; a `:buffer` CTRL-O, CTRL-I, '{A-Z0-9}, or `{A-Z0-9} command takes one
	; to another file.
	:autowrite   false
	; Like 'autowrite' but also used for commands ":edit", ":enew", ":quit",
	; ":qall" ":exit", ":xit", ":recover" and closing the Vim window.
	; Setting this option also implies that Vim behaves like 'autowrite' has
	; been set.
	:autowriteall   false
	:clipboard   "unnamedplus"
	:ignorecase   true
	:incsearch   true
	:number   true
	:relativenumber   false
	:splitbelow   true
	:splitright   true
	:wrap   false
	:scrolloff   999
	:virtualedit   "block"
	:inccommand   "split"
	:termguicolors   true
	:expandtab   true
	:tabstop   4
	:shiftwidth   0
	:softtabstop   -1
	:smarttab   true
})

(local global_options {:mapleader " "})

(fn setup []
  (each [key value (pairs options)]
    (tset vim.opt key value))


  (each [key value (pairs global_options)]
    (tset vim.g key value))

  )

{:setup setup}
