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

vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

local enter_group = vim.api.nvim_create_augroup('HaskellEnter', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
    group = enter_group,
    callback = function()
        if vim.bo.filetype == 'haskell' then
            vim.bo.tabstop = 2
            vim.bo.expandtab = true
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

-- vim.filetype.add({

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

-- Auto-import outputs when opening notebooks
local imb = function(e)
    vim.schedule(function()
        local kernels = vim.fn.MoltenAvailableKernels()
        local try_kernel_name = function()
            local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
            return metadata.kernelspec.name
        end
        local ok, kernel_name = pcall(try_kernel_name)
        if not ok or not vim.tbl_contains(kernels, kernel_name) then
            kernel_name = nil
            local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
            if venv ~= nil then
                kernel_name = string.match(venv, "/.+/(.+)")
            end
        end
        if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
            vim.cmd(("MoltenInit %s"):format(kernel_name))
        end
        vim.cmd("MoltenImportOutput")
    end)
end

vim.api.nvim_create_autocmd("BufAdd", {
    pattern = { "*.ipynb" },
    callback = imb,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.ipynb" },
    callback = function(e)
        if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
            imb(e)
        end
    end,
})

-- Auto-export outputs when saving notebooks
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.ipynb" },
    callback = function()
        if require("molten.status").initialized() == "Molten" then
            -- Use pcall to catch errors and prevent them from blocking the save
            local ok, err = pcall(function()
                vim.cmd("MoltenExportOutput!")
            end)
            if not ok then
                vim.notify("Molten export failed: " .. tostring(err), vim.log.levels.WARN)
            end
        end
    end,
})

vim.keymap.set("n", "<localleader>ic", function()
    require("image").clear()
end, { desc = "clear images", silent = true })
