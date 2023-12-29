vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- go back to file tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- paste without losing the paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- stop highlighting
vim.keymap.set("n", "<leader>no", vim.cmd.nohl)

-- quick fix stuff
-- removed for tmux purposes
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
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
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
end)
vim.keymap.set('n', '<leader>pp', '<cmd>Telescope prosession<CR>')

