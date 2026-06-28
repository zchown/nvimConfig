return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  build = function() require('typst-preview').update() end,
  opts = {
    open_cmd = 'open %s',
    root = vim.fn.getcwd(),  -- use the directory you launched nvim from
  },
  keys = {
    { '<leader>tp', '<cmd>TypstPreview<cr>',       desc = 'Typst preview open' },
    { '<leader>ts', '<cmd>TypstPreviewStop<cr>',   desc = 'Typst preview stop' },
    { '<leader>tt', '<cmd>TypstPreviewToggle<cr>', desc = 'Typst preview toggle' },
  },
}
