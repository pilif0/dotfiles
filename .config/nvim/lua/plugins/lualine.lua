return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'codedark'
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            show_filename_only = false,
          },
        },
        lualine_z = {'tabs'},
      }
    }
  }
}
