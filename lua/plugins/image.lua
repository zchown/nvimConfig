return {
    "3rd/image.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function ()
        require("image").setup({
            backend = "kitty", -- I use kitty as my terminal
            integrations = {}, 
            max_width = 100, -- feels good for me most of the time
            max_height = 12, -- feels good for me most of the time
            max_height_window_percentage = math.huge, 
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        })
        vim.g.tmux_show_only_in_active_window = true
    end,

}
