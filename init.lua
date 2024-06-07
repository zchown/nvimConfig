print("Hello Zander!")
require("opts")
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
require("lzy")
require("lsp")
require("remap")

require'lspconfig'.glsl_analyzer.setup{}

