return {
  {
    "vlime/vlime",
    dependencies = {
      "kovisoft/paredit",
    },
    ft = {"lisp"},
    config = function()
      vim.g.vlime_enable_autodoc = 1
      vim.g.vlime_window_settings = {
        sldb = { pos = "belowright", size = 20 },
        repl = { pos = "belowright", size = 10 },
      }
    end,
  }
}
