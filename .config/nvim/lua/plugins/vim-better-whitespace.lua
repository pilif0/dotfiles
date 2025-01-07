return {
  {
    'ntpeters/vim-better-whitespace',
    init = function()
      vim.cmd.highlight({ "ExtraWhitespace", "ctermbg=red guibg=#d75f5f" })
    end
  }
}
