return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('oil').setup({
        float = {
            padding = 10,
            max_width = 0,
            max_height = 0,
            border = "rounded",
            win_option = {
                winblend = 1,
            },
            override = function(conf)
                return conf
            end,
        },
    })
  end,
}
