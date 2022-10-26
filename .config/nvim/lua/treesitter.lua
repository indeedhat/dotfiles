--
-- Treesitter configuration
--
-- Parsers must be installed manually via :TSInstall
--

require('nvim-treesitter.configs').setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "blade" },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'gsn',
            scope_incremental = 'gsc',
            node_decremental = 'gsm',
        },
    },
    indent = {
        enable = true,
        disable = { 'js' },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']]'] = '@function.outer',
                [']m'] = '@class.outer',
            },
            goto_next_end = {
                [']['] = '@function.outer',
                [']M'] = '@class.outer',
            },
            goto_previous_start = {
                ['[['] = '@function.outer',
                ['[m'] = '@class.outer',
            },
            goto_previous_end = {
                ['[]'] = '@function.outer',
                ['[M'] = '@class.outer',
            },
        },
    },
}

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
