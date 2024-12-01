return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('oil').setup({
            use_default_keymaps = true,
            view_options = {
                show_hidden = true,
                is_hidden_file = function(name, bufnr)
                    return vim.startswith(name, ".")
                end,
                is_always_hidden = function(name, bufnr)
                    return false
                end,
                natural_order = true,
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
        float = {
            padding = 10,
            max_width = 0,
            max_height = 0,
            border = "rounded",
            win_option = {
                winblend = 0,
            },
            override = function(conf)
                return conf
            end,
        },
        preview = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = 60,
            max_height = 0.9,
            min_height = { 5, 0.1 },
            height = 20,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
            update_on_cursor_moved = true,
        },
        progress = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = { 10, 0.9 },
            min_height = { 5, 0.1 },
            height = nil,
            border = "rounded",
            minimized_border = "none",
            win_options = {
                winblend = 0,
            },
        },
        -- Configuration for the floating SSH window
        ssh = {
            border = "rounded",
        },
        extra_scp_args = { '-O' },
    })
    -- allows esc to dismiss oil floating window
    vim.cmd([[
    augroup OilFloatingWindow
    autocmd!
    autocmd FileType oil nnoremap <buffer> <Esc> :close<CR>
    augroup END
    ]])


end,
}
