return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        build = ":UpdateRemotePlugins",
        init = function()
            -- Image rendering setup
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_image_location = "float"

            -- Notebook-specific settings
            vim.g.molten_auto_open_output = true
            vim.g.molten_wrap_output = true
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_lines_off_by_1 = false
            vim.g.molten_output_virt_lines = true
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_tick_rate = 200
        end,
    },
    {
        "quarto-dev/quarto-nvim",
        ft = {"quarto", "markdown"},
        dependencies = {
            "jmbuhr/otter.nvim",
        },
        opts = {
            lspFeatures = {
                languages = { "python", "r", "rust" },
                chunks = "all",
                diagnostics = {
                    enabled = true,
                    triggers = { "BufWritePost" },
                },
                completion = {
                    enabled = true,
                },
            },
            codeRunner = {
                enabled = true,
                default_method = "molten",
            },
        },
    },
    {
        "GCBallesteros/jupytext.nvim",
        opts = {
            style = "markdown",
            output_extension = "md",
            force_ft = "markdown",
        },
    },
      {
        "3rd/image.nvim",
        config = function()
          require("image").setup({
            backend = "kitty",
            processor = "magick_cli",
            integrations = {
              markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = true,
                only_render_image_at_cursor_mode = "popup",
                floating_windows = true,
                filetypes = { "markdown", "vimwiki" },
              },
              typst = { enabled = true, filetypes = { "typst" } },
            },
    
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            tmux_show_only_in_active_window = true,
            editor_only_render_when_focused = true,
            hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
          })
        end,
      },
}
-- return {
--   {
--     "GCBallesteros/jupytext.nvim",
--     opts = {
--       style = "markdown",
--       output_extension = "md",
--       force_ft = "markdown",
--     },
--   },
--
--   {
--     "benlubas/molten-nvim",
--     dependencies = { "3rd/image.nvim" },
--     build = ":UpdateRemotePlugins",
--     init = function()
--       vim.g.molten_image_provider = "image.nvim"
--       vim.g.molten_use_border_highlights = true
--       -- add a few new things
--
--       -- don't change the mappings (unless it's related to your bug)
--       vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>")
--       vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>")
--       vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>")
--       vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv")
--       vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>")
--       vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>")
--       vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>")
--     end,
--   },
-- }
--
