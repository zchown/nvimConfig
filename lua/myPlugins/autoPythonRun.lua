local function getExtension(filename)
    return filename:match("^.+(%..+)$")
end

vim.api.nvim_create_user_command(
"RunPython",
function(args)
    local curfile


    if  args.args ~= nil and not (args.args == "") then
        curfile = args.args
        if getExtension(curfile) ~= ".py" then
            print("Not a python file attempting to correct")
            curfile = curfile .. ".py"
        end
    else
        curfile = vim.fn.expand("%")
        if getExtension(curfile) ~= ".py" then
            print("Not a python file")
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

    vim.fn.termopen("python " .. curfile)

    vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<Cmd>bd!<CR>', { noremap = true, silent = true })
end,
{nargs = '?', complete = 'file'}
)

