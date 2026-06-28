return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query", "python", "haskell", "rust",
          "markdown", "markdown_inline", "latex", "java",
        },
        auto_install = true,
        sync_install = false,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },

        indent = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>ss",
            node_incremental = "<leader>si",
            scope_incremental = "<leader>sc",
            node_decremental = "<leader>sd",
          },
        },

        -- FIXED NAME: textobjects (not text_objexts)
        textobjects = {
          select = {
            enable = true,
            lookahead = true,

            keymaps = {
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ii"] = "@conditional.inner",
              ["ai"] = "@conditional.outer",
              ["il"] = "@loop.inner",
              ["al"] = "@loop.outer",
              ["at"] = "@comment.outer",

              -- Notebook “cell” = fenced code block (we’ll define @code_cell.* below)
              ["ib"] = { query = "@code_cell.inner", desc = "in code block" },
              ["ab"] = { query = "@code_cell.outer", desc = "around code block" },
            },

            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"]  = "V", -- linewise
              ["@class.outer"]     = "<c-v>", -- blockwise
              ["@code_cell.outer"] = "V", -- linewise for whole code block
            },

            include_surrounding_whitespace = true,
          },

          move = {
            enable = true,
            set_jumps = false,
            goto_next_start = {
              ["]b"] = { query = "@code_cell.inner", desc = "next code block" },
            },
            goto_previous_start = {
              ["[b"] = { query = "@code_cell.inner", desc = "prev code block" },
            },
          },
        },
      })
    end,
  },
}

