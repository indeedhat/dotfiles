--
-- packer config
--

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
    [[
        augroup Packer
        autocmd!
        autocmd BufWritePost init.lua PackerCompile
        augroup end
    ]],
false
)


local use = require('packer').use
require('packer').startup(function()
    -- Util
    use 'wbthomason/packer.nvim' -- Package manager
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    use 'kana/vim-submode'
    use 'markonm/traces.vim'
    use 'machakann/vim-highlightedyank'
    use '~/Documents/github/vim-doge'
    use 'wellle/targets.vim'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-tree.lua'},
        config = function() require'nvim-tree'.setup {} end
    }
    use 'ctrlpvim/ctrlp.vim'
    use { 'junegunn/fzf', run = './install --bin' }
    use 'inkarkat/vim-ReplaceWithRegister'
    use { 'itmecho/neoterm.nvim', as = 'neoterm' }
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'junegunn/vader.vim'

    -- text objects
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'kana/vim-textobj-user'
    use 'kana/vim-textobj-indent'
    use 'kana/vim-textobj-line'
    use 'lucapette/vim-textobj-underscore'
    use 'coderifous/textobj-word-column.vim'

    -- theme
    use { 'dracula/vim', as = 'dracula' }
    use 'itchyny/lightline.vim' -- Fancier statusline
    -- use 'lukas-reineke/indent-blankline.nvim'

    -- language server
    use {
        'neovim/nvim-lspconfig',
        -- commit = "26648bf59ffeef4c4f4848764ce22d74f6235822"
    }-- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- language specific
    use 'mattn/emmet-vim'
    use 'aeke/vim-php-cs-fixer'
    use 'tomlion/vim-solidity'
    use 'jwalton512/vim-blade'

    -- My plugins
    -- use 'indeedhat/kragle'
    use "~/Documents/github/indeedhat/nvim-kragle"
    use "~/Documents/github/indeedhat/nvim-beep-test"
end)
