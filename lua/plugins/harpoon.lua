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
        end
    },
}
