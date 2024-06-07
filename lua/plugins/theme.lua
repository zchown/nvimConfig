return {
    {
        "catppuccin/nvim",
        config = function()
            vim.cmd.colorscheme("catppuccin")
            vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#600088" })
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#600088" })

        end,
    },
}

