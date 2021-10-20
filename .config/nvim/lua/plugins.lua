return require('packer').startup(function()

-- Packer can manage itself
-- use 'wbthomason/packer.nvim'

use {
  "cuducos/yaml.nvim",
  ft = {"yaml"}, -- optional
  requires = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim" -- optional
  },
  config = function ()
    require("yaml_nvim").init()
  end,
}

end)
