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

local enter_group = vim.api.nvim_create_augroup('HaskellEnter', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
    group = enter_group,
    callback = function()
        if vim.bo.filetype == 'haskell' then
            vim.bo.tabstop = 2
            vim.bo.shiftwidth = 2
            vim.bo.softtabstop = 2
            print("changed")
        end
    end,
})

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

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


-- disable auto format on save for haskell files
vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('disable-haskell-format', { clear = true }),
    pattern = "*.hs",
    callback = function()
        local current_autoformat = vim.g.autoformat
        vim.b.autoformat = false
        vim.api.nvim_create_autocmd('BufWritePost', {
            buffer = 0,
            once = true,
            callback = function()
                vim.b.autoformat = current_autoformat
            end
        })
    end,
})

