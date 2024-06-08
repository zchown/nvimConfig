-- his file is for things that I have written that offer
-- plugin like functionality more than just simple configuration

-- makes it easier to see whats happening for non vim users
DoCursorHighlight = false

local function highlightCursor()
    vim.wo.cursorlineopt = "both"
    vim.wo.cursorcolumn = true
end

local function unhighlightCursor()
    vim.wo.cursorlineopt = "number"
    vim.wo.cursorcolumn = false
end

local function updateHighlights()
    for _, winid in ipairs(vim.api.nvim_list_wins()) do
        if winid ~= vim.api.nvim_get_current_win() then
            unhighlightCursor()
        end
    end
end

vim.api.nvim_create_user_command(
    'CursorHighlight',
    function()
        DoCursorHighlight = not DoCursorHighlight
        if DoCursorHighlight then
            highlightCursor()
        else
            unhighlightCursor()
        end
    end,
    {}
)

vim.api.nvim_create_autocmd('WinEnter', {
    group = vim.api.nvim_create_augroup('highlight-cursor', { clear = true }),
    pattern = "*",
    callback = function()
        if DoCursorHighlight then
            highlightCursor()
        else
            unhighlightCursor()
        end
    end,
})

vim.api.nvim_create_autocmd('WinLeave', {
    group = vim.api.nvim_create_augroup('unhighlight-cursor', { clear = true }),
    pattern = "*",
    callback = function()
        updateHighlights()
    end,
})

--session management
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

--highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


