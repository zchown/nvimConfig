return {
    {
        "zchown/continuity.nvim",
        config = function()
            require("continuity").setup({
                save_on_exit = true,
                save_on_save = false,
                save_options = true,
                session_dir = os.getenv("HOME") .. "/.vim/session/",
                current_dir = string.gsub(vim.loop.cwd(), "/", "_"),
                tracking = { "vim.g.copilot_enabled", "vim.g.DoCurorHighlight"},
            })
        end
    }

}
