local config = require "nvchad.configs.nvimtree"

config.git = {
  enable = true,
  ignore = false,
}

config.view = {
  side = "right",
  width = 40,
}

return {
  "nvim-tree/nvim-tree.lua",
  opts = config,
}
