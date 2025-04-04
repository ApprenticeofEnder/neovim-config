-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nord",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    ["@comment.todo"] = { italic = false, fg = "orange", bg = "NONE" },
    Todo = { italic = false, fg = "orange", bg = "NONE" },
    ["@spell"] = { italic = false, fg = "orange", bg = "NONE" },
  },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    order = { "buffers", "tabs", "btns" },
  },
}

return M
