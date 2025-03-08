local config = require "nvchad.configs.nvimtree"

config.git = {
  enable = true,
  ignore = false,
}

config.view = {
  side = "right",
  preserve_window_proportions = true,
}

return config
