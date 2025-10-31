local config = require "nvchad.configs.nvimtree"

config.git = {
  enable = true,
  ignore = false,
}

config.view = {
  side = "right",
  preserve_window_proportions = true,
}

return {
  "nvim-tree/nvim-tree.lua",
  opts = config,
}
