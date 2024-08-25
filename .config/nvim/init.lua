vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("keymap")
require("lazyconf")
require("vimscript")

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

vim.opt.swapfile = false

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
