return {
    -- "luk400/vim-jukit"
    -- "goerz/jupytext",
    -- "Vigemus/iron.nvim",
    -- "GCBallesteros/vim-textobj-hydrogen",
   -- 'hkupty/iron.nvim',
   -- 'kana/vim-textobj-user',
   -- 'kana/vim-textobj-line',
   -- 'GCBallesteros/vim-textobj-hydrogen',
   -- 'GCBallesteros/jupytext.vim',   -- "kana/vim-textobj-user",
   -- {
  "GCBallesteros/NotebookNavigator.nvim",
  keys = {
    { "]h", function() require("notebook-navigator").move_cell "d" end },
    { "[h", function() require("notebook-navigator").move_cell "u" end },
    { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
    { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    { "<leader>cc", "<cmd>lua require('notebook-navigator').run_all_cells()<cr>" },
  },
  dependencies = {
    "echasnovski/mini.comment",
    -- "hkupty/iron.nvim", -- repl provider
    "akinsho/toggleterm.nvim", -- alternative repl provider
    -- "benlubas/molten-nvim", -- alternative repl provider
    "anuvyklack/hydra.nvim",
  },
  event = "VeryLazy",
  config = function()
    local nn = require "notebook-navigator"
    nn.setup({ activate_hydra_keys = "<leader>h", repl_provider = "molten", syntax_highlight = true })

  end,
}
