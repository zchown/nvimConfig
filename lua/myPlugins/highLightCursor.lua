vim.g.DoCursorHighlight = false

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
        vim.g.DoCursorHighlight = not vim.g.DoCursorHighlight
        print(vim.g.DoCursorHighlight)
        if vim.g.DoCursorHighlight then
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
        if vim.g.DoCursorHighlight then
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

-- local ncolor = vim.api.nvim_create_augroup('ncolor', { clear = true })
--
-- vim.api.nvim_create_autocmd("ModeChanged", {
--     group = ncolor,
--     pattern = "*:i",
--     callback = function()
--         vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#a6e3a1', bold = true })
--     end,
-- })
--
-- vim.api.nvim_create_autocmd("ModeChanged", {
--     group = ncolor,
--     pattern = "*:n",
--     callback = function()
--         vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#89b4fa', bold = true })
--     end,
-- })
--
-- vim.api.nvim_create_autocmd("ModeChanged", {
--     group = ncolor,
--     pattern = "*:v",
--     callback = function()
--         vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#b4befe', bold = true })
--     end,
-- })
--
-- vim.api.nvim_create_autocmd("ModeChanged", {
--     group = ncolor,
--     pattern = "*:c",
--     callback = function()
--         vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#f9e2af', bold = true })
--     end,
-- })
