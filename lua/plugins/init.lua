return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    cmd = "ConformInfo",
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.nvim-treesitter",
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "NoahTheDuke/vim-just",
    ft = { "just" },
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require "configs.nvim-ts-autotag"
    end,
  },
}
