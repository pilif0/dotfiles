" Filip Smola

" Colors:
syntax enable		" enable syntax highlighting
colorscheme codedark

" Indentation:		  each indentation level is 4 spaces
set tabstop=4		" number of visual spaces per TAB
set softtabstop=4	" numbero of spaces in TAB when editing
set expandtab		" turns TABs into spaces
set shiftwidth=4
filetype plugin indent on " filetype specific indentation settings
set autoindent		" set 'dumb' auto-indentation

" UI Layout:
set number		" diplay line numbers
set showcmd		" show command in bottom bar
set cursorline		" highlight current line
set wildmenu		" use graphical menu for autocomplete
set lazyredraw		" redraw only when needed
set showmatch		" highligh matching brackets
set fillchars=vert:\│	" set the vertical split character so the line is solid

" Searching:
set ignorecase		" ignore case when searching
set hlsearch		" highlight search results

" Folding:
set foldmethod=indent	" set folding based on indentation
set foldnestmax=10	" maximum depth 10
set foldenable		" enable folding
set foldlevelstart=10	" open files with folds open

" Movement:
" move by visual line
nnoremap j gj
nnoremap k gk
