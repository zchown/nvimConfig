local function saveSession()
    local session_file = vim.loop.cwd()
    --replace / with _ to avoid issues with path
    session_file = string.gsub(session_file, "/", "_")
    session_file = os.getenv("HOME") .. "/.vim/session/" .. session_file
    vim.cmd('mksession! ' .. session_file)
end

local function loadSession()
    local session_file = vim.loop.cwd()
    --replace / with _ to avoid issues with path
    session_file = string.gsub(session_file, "/", "_")
    session_file = os.getenv("HOME") .. "/.vim/session/" .. session_file
    if vim.fn.filereadable(session_file) == 1 then
        vim.cmd('source ' .. session_file)
    else
        print("could not read session creating new session")
        saveSession()
    end
end

local function no_args()
    return #vim.v.argv == 2
end

vim.api.nvim_create_autocmd('VimLeavePre', {
    group = vim.api.nvim_create_augroup('save-session', { clear = true }),
    callback = function()
        if no_args() then
            saveSession()
        end
    end,
})

vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('load-session', { clear = true}),
    callback = function()
        if no_args() then 
            loadSession()
            print("loaded session")
        end
    end,
})


