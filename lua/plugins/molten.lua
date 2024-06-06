return {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    event = "BufRead",
    lazy = false,
    build = ":UpdateRemotePlugins",
    init = function()
        -- this is an example, not a default. Please see the readme for more configuration options
        vim.g.molten_output_win_max_height = 50 
        vim.g.molten_output_win_hide_on_leave = false
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_open_cmd = "open"
        vim.g.molten_enter_output_behavior = "open_and_enter"
        vim.g.molten_copy_output = true
        vim.g.molten_output_win_style = false
        vim.g.molten_virt_text_output = false
        vim.g.molten_auto_open_output = false 
    end
}
