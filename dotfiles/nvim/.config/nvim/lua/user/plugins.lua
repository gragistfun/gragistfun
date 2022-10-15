local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Optimization
  use 'lewis6991/impatient.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'editorconfig/editorconfig-vim'

  use {	  
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Completion
  use {	  
    'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/cmp-nvim-lua'},
      {'lukas-reineke/cmp-rg'},
    },
    config = function()
      require('user.config.cmp')
    end
  }

  -- File Explorer
  use {	  
    'kyazdani42/nvim-tree.lua',
    requires = {{'kyazdani42/nvim-web-devicons'}},
    config = function()
        require('nvim-tree').setup {}
    end
  }

  -- Git
  use 'tpope/vim-fugitive'

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
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'vimoxide/vim-quickscope',
    config = function()
      vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
    end
  }

end)

