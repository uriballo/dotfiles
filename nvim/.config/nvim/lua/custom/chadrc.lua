local M = {}
local overrides = require('custom.plugins')

-- Plugins configurations
M.plugins = {
  options = {
    separator_line = 'round',
  },
  override = {
    ['kyazdani42/nvim-tree.lua'] = overrides.nvimtree,
    ['lukas-reineke/indent-blankline.nvim'] = overrides.indent_blankline,
    ['nvim-telescope/telescope.nvim'] = overrides.telescope,
    ['nvim-treesitter/nvim-treesitter'] = overrides.treesitter,
    ['williamboman/mason.nvim'] = overrides.mason,
  },
  user = overrides.user,
  ['max397574/better-escape.nvim'] = {
      event = "InsertEnter",
      config = function()
         require("better_escape").setup()
      end,
   },
   ['lervag/vimtes'] = {},
}

return M
