print("Hello Zander!")

require("opts")

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lzy")
require("lsp")
require("remap")
require("myPlugins")

vim.g.python3_host_prog = "~/.local/nvim-python/bin/python3"

