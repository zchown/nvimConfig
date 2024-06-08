-- his file is for things that I have written that offer
-- plugin like functionality more than just simple configuration

-- makes it easier to see whats happening for non vim users
-- TODO doesnt work well with splits 
vim.api.nvim_create_user_command(
    'CursorHighlight',
    function()
        if vim.wo.cursorlineopt == "number" then
            vim.wo.cursorlineopt = "both"
        else
            vim.wo.cursorlineopt = "number"
        end

        vim.wo.cursorcolumn = not vim.wo.cursorcolumn
    end,
    {}
)

--session management
local function save_session()
    local session_file = vim.loop.cwd()
    --replace / with _ to avoid issues with path
    session_file = string.gsub(session_file, "/", "_")
    session_file = os.getenv("HOME") .. "/.vim/session/" .. session_file
    vim.cmd('mksession! ' .. session_file)
end

local function load_session()
    local session_file = vim.loop.cwd()
    --replace / with _ to avoid issues with path
    session_file = string.gsub(session_file, "/", "_")
    session_file = os.getenv("HOME") .. "/.vim/session/" .. session_file
    if vim.fn.filereadable(session_file) == 1 then
        vim.cmd('source ' .. session_file)
    else
        print("could not read session creating new session")
        save_session()
    end
end

local function no_args()
    return #vim.v.argv == 2
end

vim.api.nvim_create_autocmd('VimLeavePre', {
    group = vim.api.nvim_create_augroup('save-session', { clear = true }),
    callback = function()
        if no_args() then
            save_session()
        end
    end,
})


vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('load-session', { clear = true}),
    callback = function()
        if no_args() then 
            load_session()
            print("loaded session")
        end
    end,
})

--highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


