--
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
    use 'markonm/traces.vim'
    use 'machakann/vim-highlightedyank'
    use '~/Documents/github/vim-doge'
    use 'wellle/targets.vim'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'ctrlpvim/ctrlp.vim'
    use { 'junegunn/fzf', run = './install --bin' }
    use 'inkarkat/vim-ReplaceWithRegister'
    use { 'itmecho/neoterm.nvim', as = 'neoterm' }
    use 'junegunn/vader.vim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'windwp/nvim-autopairs'
    use 'junegunn/vim-easy-align'

    -- syntax
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'jeroenbourgois/vim-actionscript'
    use 'tomlion/vim-solidity'
    use 'jwalton512/vim-blade'
    use 'udalov/kotlin-vim'

    -- text objects
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'kana/vim-textobj-user'
    use 'kana/vim-textobj-indent'
    use 'kana/vim-textobj-line'
    use 'lucapette/vim-textobj-underscore'
    use 'coderifous/textobj-word-column.vim'

    -- theme
    use { 'dracula/vim', as = 'dracula' }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- use 'lukas-reineke/indent-blankline.nvim'

    -- language server
    use {
        'neovim/nvim-lspconfig',
        -- commit = "26648bf59ffeef4c4f4848764ce22d74f6235822"
    }-- Collection of configurations for built-in LSP client
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    -- use 'simrat39/symbols-outline.nvim'

    -- Debugger
    -- use 'puremourning/vimspector'

    -- language specific
    use 'mattn/emmet-vim'
    use 'aeke/vim-php-cs-fixer'
    use 'iamcco/markdown-preview.vim'

    -- My plugins
    use 'indeedhat/kragle'
    -- use "~/Documents/github/indeedhat/nvim-beep-test"
end)

require'nvim-tree'.setup {
    git = {
        enable = true,
        ignore = false,
    },
}

require('nvim-autopairs').setup{}
