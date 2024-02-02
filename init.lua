print("Hello Zander!")
require("opts")
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
require("lzy")
require("lsp")
require("remap")
--
--
-- require'molten'.setup {}
-- vim.g.jupytext_fmt = 'py'
-- vim.g.jupytext_style = 'hydrogen'
-- local iron = require "iron.core"
-- iron.setup({
--   config = {
--     should_map_plug = false,
--     scratch_repl = true,
--     repl_definition = {
--       python = {
--         command = { "ipython" },
--         format = require("iron.fts.common").bracketed_paste,
--       },
--     },
--   },
--   keymaps = {
--     send_motion = "ctr",
--     visual_send = "ctr",
--   },
-- })
