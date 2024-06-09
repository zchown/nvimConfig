return {
    "terrortylor/nvim-comment",
    event = "VeryLazy",
    lazy = true, 
    config = function()
        require("nvim_comment").setup()
    end,
}
