return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
          require('telescope').load_extension('prosession')
      end
}
