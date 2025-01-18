return {
  {
    'robbielyman/latex.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'kylechui/nvim-surround',
    },
    config = { surrounds = { enabled = true } },
  }
}
