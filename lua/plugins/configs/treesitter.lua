local present, treesitter = pcall(require, 'nvim-treesitter.configs')

local options = {
  highlight = {
    enable = true,
    use_languagetree = true
  }
}

treesitter.setup(options)
