-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "rxyhn",
}

M.plugins = {
   override = {
      ["kyazdani42/nvim-tree.lua"] = require "custom.plugins.nvimtree",
      ["nvim-treesitter/nvim-treesitter"] = require "custom.plugins.treesitter"
   }
}

return M
