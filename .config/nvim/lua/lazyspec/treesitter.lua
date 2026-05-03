return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")

            -- Optional: custom install dir (default shown)
            ts.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            -- ✅ Explicit parser install list (replaces ensure_installed)
            local parsers = {
                "lua",
                "vim",
                "vimdoc",
                "bash",
                "python",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "yaml",
                "toml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "graphql",
                "go",
                "hcl",
                "arduino",
                "c",
                "rust"
            }

            -- Async install (safe at startup)
            ts.install(parsers)

            -- ✅ Enable treesitter features per-buffer
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)

                    -- treesitter-based indent (replaces indent.enable)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },


    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter", branch = "main" },
        },
        init = function()
            -- recommended to avoid builtin ftplugin clashes
            vim.g.no_plugin_maps = true
        end,
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                    selection_modes = {
                        ["@function.outer"] = "V",
                        ["@class.outer"] = "<c-v>",
                    },
                },
                move = {
                    set_jumps = true,
                },
            })

            local select = require("nvim-treesitter-textobjects.select")
            local move = require("nvim-treesitter-textobjects.move")

            -- ✅ Select mappings (same semantics as before)
            vim.keymap.set({ "x", "o" }, "af",
                function() select.select_textobject("@function.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "if",
                function() select.select_textobject("@function.inner", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ac",
                function() select.select_textobject("@class.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ic",
                function() select.select_textobject("@class.inner", "textobjects") end)

            -- ✅ Movement mappings
            vim.keymap.set("n", "]m",
                function() move.goto_next_start("@function.outer", "textobjects") end)
            vim.keymap.set("n", "]M",
                function() move.goto_next_end("@function.outer", "textobjects") end)
            vim.keymap.set("n", "[m",
                function() move.goto_previous_start("@function.outer", "textobjects") end)
            vim.keymap.set("n", "[M",
                function() move.goto_previous_end("@function.outer", "textobjects") end)
        end,
    }
}
