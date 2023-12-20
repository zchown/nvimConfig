return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "python", "haskell", "rust", "markdown", "latex", "java"},
                auto_install = true,
                sync_install = false,

                highlight = { 
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },

                indent = { endable = true },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>ss",
                        node_incremental = "<leader>si",
                        scope_incremental = "<leader>sc",
                        node_decremental = "<leader>sd",
                    },
                },

                text_objexts = {
                    select = {
                        enable = true,

                        lookahead = true,

                        keymaps = {
                            ['aa'] = '@parameter.outer',
                            ['ia'] = '@parameter.inner',
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['ac'] = '@class.outer',
                            ['ic'] = '@class.inner',
                            ['ii'] = '@conditional.inner',
                            ['ai'] = '@conditional.outer',
                            ['il'] = '@loop.inner',
                            ['al'] = '@loop.outer',
                            ['at'] = '@comment.outer',
                        },

                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'V', -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },

                        include_surrounding_whitespace = true,
                    },
                },
            })
        end,
    },

}
