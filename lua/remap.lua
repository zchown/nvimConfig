vim.keymap.set('i', '<C-t>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})

vim.g.copilot_no_tab_map = true

function toggle_copilot()
    if vim.g.copilot_enabled == true then
        vim.g.copilot_enabled = false
        print("Copilot Disabled")
    else
        vim.g.copilot_enabled = true
        print("Copilot Enabled")
    end
end

vim.keymap.set('n', '<leader>ct', toggle_copilot, { desc = 'Toggle [C]opilot [T]rue/False' })

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
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")

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
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)  -- ← this was missing, causing everything below to be swallowed
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pm', function()
  require('telescope.builtin').symbols({ sources = { 'math' } })
end, { desc = 'Search Math Symbols' })

vim.keymap.set('v', 'aa', '<cmd> TSTextobjectSelect @parameter.outer<CR>')
vim.keymap.set('v', 'ia', '<cmd> TSTextobjectSelect @parameter.inner<CR>')
vim.keymap.set('v', 'af', '<cmd> TSTextobjectSelect @function.outer<CR>')
vim.keymap.set('v', 'if', '<cmd> TSTextobjectSelect @function.inner<CR>')
vim.keymap.set('v', 'ac', '<cmd> TSTextobjectSelect @class.outer<CR>')
vim.keymap.set('v', 'ic', '<cmd> TSTextobjectSelect @class.inner<CR>')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") } );
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
require('telescope').load_extension('symbols')
vim.keymap.set('n', '<leader>pm', function()
  require('telescope').extensions.symbols.symbols({ sources = { 'math' } })
end, { desc = 'Search Math Symbols' })
end)

vim.keymap.set('v', 'ii', '<cmd> TSTextobjectSelect @conditional.inner<CR>')
vim.keymap.set('v', 'ai', '<cmd> TSTextobjectSelect @conditional.outer<CR>')
vim.keymap.set('v', 'il', '<cmd> TSTextobjectSelect @loop.inner<CR>')
vim.keymap.set('v', 'al', '<cmd> TSTextobjectSelect @loop.outer<CR>')
vim.keymap.set('v', 'at', '<cmd> TSTextobjectSelect @comment.outer<CR>')

-- useful for zig
vim.keymap.set('v', 'i|', '<cmd> normal _f|lvt|<CR>')
vim.keymap.set('v', 'a|', '<cmd> normal _f|vt|<CR>')
vim.keymap.set('n', 'ci|', '<cmd> normal _f|lct|<CR>')
vim.keymap.set('n', 'di|', '<cmd> normal _f|ldt|<CR>')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Essential keybinds
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })

-- Recommended additional keybinds
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

-- Quarto runner keybinds
local runner = require("quarto.runner")
vim.keymap.set("n", "<localleader>rc", runner.run_cell, { desc = "run cell", silent = true })
vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<localleader>rA", runner.run_all, { desc = "run all cells", silent = true })
vim.keymap.set("n", "<localleader>rl", runner.run_line, { desc = "run line", silent = true })
vim.keymap.set("v", "<localleader>r", runner.run_range, { desc = "run visual range", silent = true })

vim.keymap.set("n", "<localleader>nc", function()
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, line, line, false, {
        "",
        "```python",
        "",
        "```",
        ""
    })
    vim.api.nvim_win_set_cursor(0, {line + 3, 0})
    vim.cmd("startinsert")
end, { desc = "new code cell" })
