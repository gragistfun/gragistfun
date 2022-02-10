local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {	  
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- File Explorer
  use {	  
    'kyazdani42/nvim-tree.lua',
    requires = {{'kyazdani42/nvim-web-devicons'}},
    config = function()
        require('nvim-tree').setup {}
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require('gitsigns').setup()
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Colors
  use {'dracula/vim',
    as = 'dracula',
    config = function()
        vim.cmd([[colorscheme dracula]])
    end
  }

  -- Utilities
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'

end)

