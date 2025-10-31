require("lazy").setup {
  spec = {
    { import = "vscode-config.plugins" },
  },
  defaults = {
    lazy = true,
  },
  install = {
    missing = true,
  },
  checker = {
    enabled = false, -- Disable update checker to prevent UI prompts
  },
  change_detection = {
    enabled = false, -- Disable change detection to prevent UI notifications
  },
  ui = {
    border = "none", -- Disable borders to prevent TUI issues in VSCode
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}
