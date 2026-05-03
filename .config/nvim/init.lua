vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0


require("keymap")
require("lazyconf")
require("vimscript")

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

vim.opt.swapfile = false

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

vim.opt.spell = false
vim.opt.spelllang = { "en_gb" }

vim.wo.wrap = false
