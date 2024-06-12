vim.g.ContinuityDoSave = true
vim.g.ContinuitySaveOnSave = false
vim.g.ContinuityDoOptions = true
vim.g.Session_dir = os.getenv("HOME") .. "/.vim/session/"

--create a list of options to keep track of
vim.g.ContinuityTracking = {
    "vim.g.copilot_enabled",
    "vim.g.DoCursorHighlight",
}

local function saveSession()
  local session_file = vim.loop.cwd()
    --replace / with _ to avoid issues with path
    session_file = string.gsub(session_file, "/", "_")
    session_file = vim.g.Session_dir .. session_file
    vim.cmd('mksession! ' .. session_file)
end

local function saveOptions()
    local option_file = vim.loop.cwd()
    option_file = string.gsub(option_file, "/", "_")
    option_file = vim.g.Session_dir .. option_file .. "_options.lua"
    local file = io.open(option_file, "w")
    if file then
        for _, option in ipairs(vim.g.ContinuityTracking) do
            local str = loadstring("return " .. option)()
            file:write(option .. " = " .. tostring(str) .. "\n")
        end
        file:close()
    else
        print("failed to save Continuity Options")
    end
end

local function saveContinuity()
    print("saving session")
    saveSession()
    if vim.g.ContinuityDoOptions and #vim.g.ContinuityTracking > 0 then
        print("saving options")
        saveOptions()
    end
end

local function loadSession()
  local session_file = vim.loop.cwd()
    --replace / with _ to avoid issues with path
    session_file = string.gsub(session_file, "/", "_")
    session_file = vim.g.Session_dir .. session_file
    if vim.fn.filereadable(session_file) == 1 then
        vim.cmd('source ' .. session_file)
    else
        print("could not read session creating new session")
        saveContinuity()
    end
end

local function loadOptions()
    local option_file = vim.loop.cwd()
    option_file = string.gsub(option_file, "/", "_")
    option_file = vim.g.Session_dir .. option_file .. "_options.lua"
    if vim.fn.filereadable(option_file) == 1 then
        vim.cmd('source ' .. option_file)
    else
        print("could not read options creating new options")
        saveOptions()
    end
end

local function loadContinuity()
    loadSession()
    if vim.g.ContinuityDoOptions and #vim.g.ContinuityTracking > 0 then
        loadOptions()
    end
end

local function no_args()
    return #vim.v.argv == 2
end

vim.api.nvim_create_autocmd('VimLeavePre', {
    group = vim.api.nvim_create_augroup('save-continuity', { clear = true }),
    callback = function()
        if no_args() and vim.g.ContinuityDoSave then
            saveContinuity()
        end
    end,
})

vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('load-continuity', { clear = true}),
    callback = function()
        if no_args() then 
            loadContinuity()
            print("Continuity Loaded")
        end
    end,
})

vim.api.nvim_create_user_command(
"StopContinuity",
function()
    vim.g.ContinuityDoSave = false
end,
{nargs = 0})

vim.api.nvim_create_user_command(
"StartContinuity",
function()
    vim.g.ContinuityDoSave = true
end,
{nargs = 0})

vim.api.nvim_create_user_command(
"SaveContinuity",
function()
    saveContinuity()
end,
{nargs = 0})

if vim.g.ContinuitySaveOnSave then
    vim.api.nvim_create_autocmd('BufWritePost', {
        group = vim.api.nvim_create_augroup('save-session', { clear = true }),
        pattern = '*',
        callback = function()
            if no_args() and vim.g.ContinuityDoSave then
                saveContinuity()
            end
        end,
    })
end
