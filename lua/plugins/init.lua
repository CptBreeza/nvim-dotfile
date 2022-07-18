vim.cmd "packadd packer.nvim"

local _, packer = pcall(require, "packer")

local options = {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "double" }
      end,
   },
   git = {
      clone_timeout = 6000, -- seconds
   },
   auto_clean = true,
   compile_on_sync = true,
   snapshot = nil,
}

packer.init(options)

packer.startup(function(use)
  use {
    'wbthomason/packer.nvim',
    event = {
      'VimEnter'
    }
  }

  use 'nvim-lua/plenary.nvim'

  use 'NvChad/extensions'

  use {
    'NvChad/base46',
    after = 'packer.nvim',
    config = function()
      local ok, base46 = pcall(require, 'base46')

      if ok then
        base46.load_theme()
      end
    end
  }

  use {
    'kyazdani42/nvim-web-devicons',
    after = 'base46',
    config = function()
      require 'plugins.configs.icons'
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    cmd = {
      'NvimTreeToggle',
      'NvimTreeFocus'
    },
    config = function()
      require 'plugins.configs.nvimtree'
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = function ()
      require("plugins.configs.telescope")
    end
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  use {
    'feline-nvim/feline.nvim',
    after = 'nvim-web-devicons',
    config = function()
      require 'plugins.configs.statusline'
    end
  }

  use {
    'akinsho/bufferline.nvim',
    after = 'nvim-web-devicons',
    config = function()
      require 'plugins.configs.bufferline'
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    opt = true,
    config = function()
      require('plugins.configs.others').gitsigns()
    end,
    setup = function()
      nvchad.packer_lazy_load 'gitsigns.nvim'
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufRead', 'BufNewFile' },
    run = ':TSUpdate',
    config = function()
      require 'plugins.configs.treesitter'
    end
  }

  use {
    'williamboman/nvim-lsp-installer',
    opt = true,
    setup = function()
       nvchad.packer_lazy_load 'nvim-lsp-installer'
       -- reload the current file so lsp actually starts for it
       vim.defer_fn(function()
          vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
       end, 0)
    end
  }

  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-lsp-installer',
    module = 'lspconfig',
    config = function()
      require 'plugins.configs.lsp_installer'
      require 'plugins.configs.lspconfig'
    end
  }

  use {
    'rafamadriz/friendly-snippets',
    module = 'cmp_nvim_lsp',
    event = 'InsertEnter'
  }

  use {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function()
      require 'plugins.configs.cmp'
    end
  }

  use {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = function()
      require('plugins.configs.others').luasnip()
    end
  }

  use {
    'saadparwaiz1/cmp_luasnip',
    after = 'LuaSnip'
  }

  use {
    'hrsh7th/cmp-nvim-lua',
    after = 'cmp_luasnip'
  }

  use {
    'hrsh7th/cmp-nvim-lsp',
    after = 'cmp-nvim-lua'
  }

  use {
    'hrsh7th/cmp-buffer',
    after = 'cmp-nvim-lsp'
  }

  use {
    'hrsh7th/cmp-path',
    after = 'cmp-buffer'
  }

  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function ()
      require("plugins.configs.others").autopairs()
    end
  }

  use { "elixir-editors/vim-elixir" }
end)
