return {
    "github/copilot.vim",
    event = "VeryLazy",
    lazy = true, 
    config = function()
        -- I really only like using copilot for specific tasks so off by default is good
        vim.g.copilot_enabled = 0
    end,
}
