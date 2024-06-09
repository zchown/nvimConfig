return {
    'https://github.com/norcalli/nvim-colorizer.lua',
    event = "VeryLazy",
    lazy = true,
    config = function()
        require('colorizer').setup()
    end,

}
