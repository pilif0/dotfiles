" General Settings

scriptencoding utf-8
set nocompatible
set hidden

" --- General Settings ---
set backspace=indent,eol,start  " Allow backspacing over everything in Insert mode
set history=1000                " Keep 1000 lines of command history
set number                      " Display line numbers
set ruler                       " Display cursor position all the time
set showcmd                     " Display incomplete commands
set incsearch                   " Do incremental search
if exists('&inccommand')
    set inccommand=split
end
set ignorecase		            " Ignore case when searching
set hlsearch		            " Highlight search results
set showmatch		            " Highligh matching brackets
set linebreak                   " Wrap lines on word boundaries
set scrolloff=3                 " Don't let the cursor touch the edge of the viewport
set splitright                  " Vertical split uses right half
set splitbelow                  " Horizontal split uses bottom half
set timeoutlen=1000              " Command timeout
if exists('&breakindent')
    set breakindent             " Indent wrapped lines to the same level
endif
set colorcolumn=+0              " Highlight column when text width is set
set noshowmode                  " Don't show "-- INSERT --" in insert mode (preserves command output)

" Indentation
set expandtab       " Expand tabs into spaces
set tabstop=4       " Default number of spaces for hard tab
set softtabstop=4   " Default number of spaces for soft tab
set shiftwidth=4    " Number of spaces to insert when <TAB> is pressed
set autoindent      " Carry over indent on new line
set smarttab        " Tab to shiftwidth

" Folding
set foldenable		    " Enable folding
set foldmethod=indent	" Set folding based on indentation
set foldnestmax=4	    " Maximum folding depth
set foldlevelstart=4	" Open files with folds open

" Non-printing characters
"TODO use vim-better-whitespace for trailing whitespace
set list                " Show certain non-printing characters as printed
set listchars-=trail:-  " Don't show trailing whitespace in listchars output
set listchars-=eol:$    " Don't show trailing end-of-line characters

" Show potential matches above completion, complete first immediately
set wildmenu
set wildmode=full

" --- Convenience Commands and Abbreviations ---

" Make commonly mistyped commands work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

" Use :C to clear hlsearch
command! C nohlsearch

" Force write readonly files using sudo
command! WS w !sudo tee %

" Open help in a new tab
cabbrev help tab help

" --- Custom Keybindings ---

" Make Space leader
map <space> <leader>

" Make navigating wrapped lines behave like normal lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^
noremap <silent> _ g_

" Disable K and Q
noremap K <nop>
noremap Q <nop>

" Highlight the current word under the cursor (instead of highlight + next)
nnoremap * :keepjumps normal! *N<CR>
nnoremap # :keepjumps normal! #N<CR>

" Recursive to pick up the * mapping
nmap g* *:vimgrep // %<CR>
nmap g# #:vimgrep // %<CR>

" goto file in new tab, instead of in current buffer
nnoremap <silent> gf <C-W>gf
nnoremap <silent> gF <C-W>gF
vnoremap <silent> gf <C-W>gf
vnoremap <silent> gF <C-W>gF

" Create a manual fold with the region determined by going to the end of the
" line, entering visual line mode, then jumping to the matching brace. So:
"
"     const foldThisFunction = (x) => {
"       // ...
"     }
"
" cursor on first line will fold entire function definition, etc.
nnoremap <silent> <leader>zf $V%zf

" Some <leader> mappings to cut / copy / paste with system clipboard.
noremap <silent> <leader>y "+y
noremap <silent> <leader>Y "+Y
noremap <silent> <leader>d "+d
noremap <silent> <leader>D "+D
noremap <silent> <leader>p "+p
noremap <silent> <leader>P "+P

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" --- Terminal Settings ---

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Open terminal in a split
command! Vte vsplit | terminal
command! Ste split | terminal

" Keybindings that make Vim behave like tmux when not inside tmux
if $TMUX ==# ''
  tnoremap <C-f>1 <C-\><C-n>1gt
  tnoremap <C-f>2 <C-\><C-n>2gt
  tnoremap <C-f>3 <C-\><C-n>3gt
  tnoremap <C-f>4 <C-\><C-n>4gt
  tnoremap <C-f>5 <C-\><C-n>5gt
  tnoremap <C-f>6 <C-\><C-n>6gt
  tnoremap <C-f>7 <C-\><C-n>7gt
  tnoremap <C-f>8 <C-\><C-n>8gt
  tnoremap <C-f>9 <C-\><C-n>9gt

  tnoremap <C-f>" <C-\><C-n>:Vte<CR>
  tnoremap <C-f>% <C-\><C-n>:Ste<CR>
  tnoremap <C-f>c <C-\><C-n>:tabe term://zsh<CR>

  " Need recursive map to pick up fzf mapping
  tmap <C-f><C-p> <C-\><C-n><C-p>
  tnoremap <C-f><CR> <C-\><C-n>:

  tmap <C-f>- <C-\><C-n><leader>-
  tmap <C-f>= <C-\><C-n><leader>=

  nnoremap <C-f>1 1gt
  nnoremap <C-f>2 2gt
  nnoremap <C-f>3 3gt
  nnoremap <C-f>4 4gt
  nnoremap <C-f>5 5gt
  nnoremap <C-f>6 6gt
  nnoremap <C-f>7 7gt
  nnoremap <C-f>8 8gt
  nnoremap <C-f>9 9gt
  nnoremap <C-f>" :Vte<CR>
  nnoremap <C-f>% :Ste<CR>
  nnoremap <C-f>c :tabe term://zsh<CR>

  nmap <C-f>- <leader>-
  nmap <C-f>= <leader>=
endif

" Keybindings to switch panes when in an embedded terminal buffer
" (Neovim-specific)
if exists(':tnoremap')
  tnoremap <M-e> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif

" --- Terminal GUI Settings ---

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" This lets us use 24-bit "true" colors in the terminal
"if exists('+termguicolors')
"  set termguicolors
"endif

" --- Autocommands ---
augroup vimrc
  " Clear the current autocmd group, in case we're re-sourcing the file
  au!

  " Jump to the last known cursor position when opening a file.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

augroup END
