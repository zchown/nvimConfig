local function getExtension(filename)
    return filename:match("^.+(%..+)$")
end

vim.api.nvim_create_user_command(
"RunLatex",
function(args)
    local curfile
    if  args.args ~= nil and not (args.args == "") then
        curfile = args.args
        if getExtension(curfile) ~= ".tex" and getExtension(curfile) ~= ".md" then
            print("Not a latex/md file attempting to correct")
            curfile = curfile .. ".tex"
        end
    else
        curfile = vim.fn.expand("%")
        if getExtension(curfile) ~= ".tex" and getExtension(curfile) ~= ".md" then
            print("Not a latex/md file")
            return
        end
    end

    if not vim.loop.fs_stat(curfile) then
        print("File does not exist")
        return
    end

    local width = math.floor(vim.o.columns * 0.5)
    local height = math.floor(vim.o.lines * 0.5)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local buf = vim.api.nvim_create_buf(false, true)

    local border_chars = {
        {"╭", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╮", "FloatBorder"},
        {"│", "FloatBorder"},
        {"╯", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╰", "FloatBorder"},
        {"│", "FloatBorder"}
    }

    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = border_chars
    })
    -- current file without extension
    local noext = curfile:match("(.+)%..+")
    if getExtension(curfile) == ".md" then
        vim.fn.termopen("pandoc " .. curfile .. " -o " .. noext .. ".pdf")
    else
        vim.fn.termopen("pdflatex " .. curfile)
    end

    vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<Cmd>bd!<CR>', { noremap = true, silent = true })
end,
{nargs = '?', complete = 'file'}
)

