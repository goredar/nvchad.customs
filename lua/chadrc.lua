---@type ChadrcConfig
local M = {}
-- local highlights = require "highlights"

M.ui = {
  theme = "catppuccin",
  transparency = true,
  -- theme = "catppuccin",
  -- hl_override = highlights.override,
  -- hl_add = highlights.add,
  extended_integrations = { "trouble", "alpha", "dap" },
}

return M
