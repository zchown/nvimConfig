return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = function()
            local harpoon = require("harpoon")
            ---@diagnostic disable-next-line: missing-parameter
            harpoon:setup()
            local function map(lhs, rhs, opts)
                vim.keymap.set("n", lhs, rhs, opts or {})
            end
            map("<leader>a", function() harpoon:list():append() end)
            map("<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end)
            vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end)
            vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end)
            vim.keymap.set("n", "<A-8>", function() harpoon:list():select(8) end)
            vim.keymap.set("n", "<A-9>", function() harpoon:list():select(9) end)
        end
    },
}
