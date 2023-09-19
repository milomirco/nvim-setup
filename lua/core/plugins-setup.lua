  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- insert packer plugins here

  -- themes
  use "folke/tokyonight.nvim"
  
  vim.cmd[[ set background=dark ]]
  vim.cmd[[colorscheme tokyonight]]
  
  -- nvim tree for sidebar & telescope
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-treesitter/nvim-treesitter"

  
  -- telescope setup, fuzzy finder
  use {
      "nvim-telescope/telescope.nvim", tag = "0.1.3",
      requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- end if plugins section
    if packer_bootstrap then
    require('packer').sync()
  end
end)
