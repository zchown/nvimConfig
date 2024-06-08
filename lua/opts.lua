vim.opt.relativenumber = true
vim.opt.number = true 

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.wrap = true
vim.smartindent = true

vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"
vim.opt.ignorecase = true

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.g.mapleader = " "

vim.opt.cursorlineopt = "number"
vim.opt.cursorline = true

vim.filetype.add({
    pattern = {
      ['.*%.wgsl'] = 'wgsl',
    },
})
vim.filetype.add { extension = { wgsl = "wgsl" } }

if vim.g.neovide then
    vim.g.neovide_font_size = 20
    vim.g.neovide_scale_factor = 1.25
end


