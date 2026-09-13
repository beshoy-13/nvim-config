---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "bearded-arc",
  hl_override = {
    DiagnosticUnnecessary = { fg = "grey", italic = true },
  },
}

M.ui = {
  tabufline = {
    order = { "buffers", "tabs", "btns", "treeOffset" },
  },
}

return M
