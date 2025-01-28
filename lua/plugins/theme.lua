return {
    "oxfist/night-owl.nvim",
    config = function()
        require("night-owl").setup()
        vim.cmd.colorscheme("night-owl")
        vim.cmd("hi Normal guibg=#010d18")

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "haskell",
            callback = function()
                vim.api.nvim_set_hl(0, "@string", { fg = "#2D9440" })
                vim.api.nvim_set_hl(0, "@string.special", { fg = "#2D9440" })
                vim.api.nvim_set_hl(0, "@string.quoted", { fg = "#2D9440" })
                vim.api.nvim_set_hl(0, "@string.delimiter", { fg = "#2D9440" })
                vim.api.nvim_set_hl(0, "@string.escape", { fg = "#2D9440" })
            end,
        })
    end,
}
