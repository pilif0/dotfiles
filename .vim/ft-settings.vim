" File-type Settings

"TODO add AsciiDoctor

" Enable file type detection.
filetype plugin indent on

augroup myFiletypes
  au!

  " Patch filetypes for common extensions:

  " Markdown files
  au BufRead,BufNewFile *.md setlocal filetype=markdown
  " Treat all .tex files as latex
  au BufRead,BufNewFile *.tex setlocal filetype=tex
  " LaTeX class files
  au BufRead,BufNewFile *.cls setlocal filetype=tex
  " Ensure that *.hs files are haskell files (sometimes Stack scripts aren't)
  au BufRead,BufNewFile *.hs setlocal filetype=haskell

  " Turn on spell checking by default for these filetypes
  au FileType markdown,tex setlocal spell

  " Show color column in some filetypes
  au FileType haskell setlocal cc=80
  au FileType javascript setlocal cc=80
  au FileType cpp setlocal cc=120
  au FileType sh setlocal cc=80
  au FileType scala setlocal cc=120

  " Fix up some commentstrings
  au FileType cpp setlocal commentstring=//%s

  if has('##TermOpen')
    au TermOpen * setlocal nonumber
    au TermOpen * startinsert
  endif
  if has('##TermClose')
    " Auto-close terminal buffer when it ends
    au TermClose * q
  endif
  " scrolloff can only be set globally
  au BufEnter term://* set scrolloff=0
  au BufLeave term://* set scrolloff=4

augroup END

" Lispwords
source $HOME/.vim/lispwords.vim
