vim.keymap.set('i', '<C-t>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})

vim.g.copilot_no_tab_map = true

local luaGroup = vim.api.nvim_create_augroup("FileTypeLua", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = luaGroup,
    pattern = {'lua'},
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "<localleader><leader>", ":luafile %<CR>",
        { silent = true, desc = "run lua file" })
    end,
})

-- go back to file tree floating
vim.api.nvim_set_keymap('n', '<leader>pv', ':lua require("oil").open_float()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>fm', vim.cmd.Oil);

-- python notebook remaps
local pythonGroup = vim.api.nvim_create_augroup("FileTypePythonJupyter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = pythonGroup,
    pattern = {'python', 'ipynb'},
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "<leader><leader>", ":RunPython<CR>",
        { silent = true, desc = "run python file" })
        vim.api.nvim_buf_set_keymap(0, "n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>",
        { silent = true, desc = "show/enter output" })
        vim.api.nvim_buf_set_keymap(0, "n", "<localleader>oh", ":MoltenHideOutput<CR>",
        { silent = true, desc = "hide output" })
        vim.api.nvim_buf_set_keymap(0, "n", "<localleader>mi", ":MoltenInit<CR>",
        { silent = true, desc = "Initialize the plugin" })
        vim.api.nvim_buf_set_keymap(0, "n", "<localleader>e", ":MoltenEvaluateOperator<CR>",
        { silent = true, desc = "run operator selection" })
        vim.api.nvim_buf_set_keymap(0, "n", "<localleader>rl", ":MoltenEvaluateLine<CR>",
        { silent = true, desc = "evaluate line" })
        vim.api.nvim_buf_set_keymap(0, "n", "<localleader>rr", ":MoltenReevaluateCell<CR>",
        { silent = true, desc = "re-evaluate cell" })
        vim.api.nvim_buf_set_keymap(0, "v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
        { silent = true, desc = "evaluate visual selection" })
    end,
})

local latexGroup = vim.api.nvim_create_augroup("FileTypeLatex", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = latexGroup,
    pattern = {'tex', "markdown"},
    callback = function()
        vim.keymap.set("n", "<leader><leader>", ":RunLatex<CR>", {
            buffer = true,
            silent = true,
            desc = "run latex file"
        })
    end,
})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- copy to the system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- move highlighted text following indents
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor centeed 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in place when using J
vim.keymap.set("n", "J", "mzJ`z")

-- keep search terms in center
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "n", "nzz")

-- paste without losing the paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- stop highlighting
vim.keymap.set("n", "<leader>no", vim.cmd.nohl)

-- quick fix stuff
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- toggle undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- start replacing current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") } );
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
end)

vim.keymap.set('v', 'aa', '<cmd> TSTextobjectSelect @parameter.outer<CR>')
vim.keymap.set('v', 'ia', '<cmd> TSTextobjectSelect @parameter.inner<CR>')
vim.keymap.set('v', 'af', '<cmd> TSTextobjectSelect @function.outer<CR>')
vim.keymap.set('v', 'if', '<cmd> TSTextobjectSelect @function.inner<CR>')
vim.keymap.set('v', 'ac', '<cmd> TSTextobjectSelect @class.outer<CR>')
vim.keymap.set('v', 'ic', '<cmd> TSTextobjectSelect @class.inner<CR>')
vim.keymap.set('v', 'ii', '<cmd> TSTextobjectSelect @conditional.inner<CR>')
vim.keymap.set('v', 'ai', '<cmd> TSTextobjectSelect @conditional.outer<CR>')
vim.keymap.set('v', 'il', '<cmd> TSTextobjectSelect @loop.inner<CR>')
vim.keymap.set('v', 'al', '<cmd> TSTextobjectSelect @loop.outer<CR>')
vim.keymap.set('v', 'at', '<cmd> TSTextobjectSelect @comment.outer<CR>')
