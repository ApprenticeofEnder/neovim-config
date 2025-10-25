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
    lazy = false,
    ft = { "typescriptreact", "tsx", "svelte" },
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
      }
    end,
  },

  {
    "chomosuke/typst-preview.nvim",
    lazy = false,
    ft = "typst",
    version = "1.*",
    opts = {
      get_root = function(filename)
        return vim.fn.getcwd()
      end,
    }, -- lazy.nvim will implicitly calls `setup {}`
  },

  {
    "brianhuster/live-preview.nvim",
    dependencies = {
      -- You can choose one of the following pickers
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("livepreview.config").set()
    end,
  },

  "JoosepAlviste/nvim-ts-context-commentstring",
  "nvim-java/nvim-java",
}
