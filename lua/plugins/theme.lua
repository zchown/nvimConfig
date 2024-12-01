return {
    "oxfist/night-owl.nvim",
    config = function()
        require("night-owl").setup()
        vim.cmd.colorscheme("night-owl")
        -- set background to dark_blue
        vim.cmd("hi Normal guibg=#010d18")

      end,
    -- {
    --     "catppuccin/nvim",
    --     config = function()
    --         vim.cmd.colorscheme("catppuccin")
    --         vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#600088" })
    --         vim.api.nvim_set_hl(0, "CursorLine", { bg = "#600088" })
    --
    --     end,
    -- },
}

