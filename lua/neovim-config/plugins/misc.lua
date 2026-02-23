local is_nixos = os.getenv("NIX_NEOVIM") == "1"

return {
  {
    "mason-org/mason.nvim",
    enable = not is_nixos
  },
  {
    "likec4/likec4.nvim",
    build = "pnpm install -g @likec4/language-server",
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
}
