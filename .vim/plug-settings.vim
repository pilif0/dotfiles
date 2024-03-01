" Plugin settings

scriptencoding utf-8

" --- Pathogen ---

" Pathogen is in a non-standard location: modify the rtp to reflect that
set runtimepath+=~/.vim/bundle/pathogen

" Let Pathogen take over the runtimepath to make plugins in ~/.vim/bundle work
execute pathogen#infect()

" Generate all helptags on startup
Helptags

" --- altercation/vim-colors-solarized settings ---
" Set dark mode
set background=dark

" Set the colorscheme
colorscheme solarized

" Make splits look more like tmux, with thin chars
" (Has to be after solarized to take effect)
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

" --- vim-airline/vim-airline ---
" Fancy arrow symbols, requires a patched font
let g:airline_powerline_fonts = 1
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Don't take up extra space with +/-/~ of 0
let g:airline#extensions#hunks#non_zero_only = 1
" Limit wordcount to where it makes sense
let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|pandoc|rst|org'
" Always show statusbar
set laststatus=2
" Set solarized theme
let g:airline_theme='solarized'
" Set solarized theme to dark
let g:airline_solarized_bg='dark'
" Slightly modify the theme colors
let g:airline_solarized_normal_green = 1
" Fancy stuff in tabline as well
let g:airline#extensions#tabline#enabled = 1
" Don't try to re-init tmuxline every time (I've made special modifications)
let g:airline#extensions#tmuxline#enabled = 0
" Don't use tagbar
let g:airline#extensions#tagbar#enabled = 0
" Don't show line percentage
let g:airline_section_z = airline#section#create(['windowswap', 'obsession', 'linenr', 'maxlinenr', ' %3v'])
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" --- Raimondi/delimitMate settings ---
let g:delimitMate_expand_cr = 1
let g:delimitMate_excluded_regions = ''
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --- netrw ---
" When viewing directories, show nested tree mode
let g:netrw_liststyle=3
" Do not write .netrwhist
let g:netrw_dirhistmax=0
" Turn off buffer reuse to fix https://github.com/tpope/vim-vinegar/issues/13
let g:netrw_fastbrowse=0

" --- airblade/vim-gitgutter ---
hi clear SignColumn

nnoremap <leader>ht :GitGutterLineHighlightsToggle<CR>
nnoremap <leader>hm :let g:gitgutter_diff_base = 'master'<CR>:e<CR>
nnoremap <leader>r  :GitGutterUndoHunk<CR>
nnoremap <leader>s  :GitGutterStageHunk<CR>

" Overrides these bindings from vanilla Vim
nnoremap gp :GitGutterPrevHunk<CR>
nnoremap gn :GitGutterNextHunk<CR>

" --- ntpeters/vim-better-whitespace ---
" Don't highlight whitespace in git commit messages (for diffs)...
let g:better_whitespace_filetypes_blacklist=['gitcommit']
" ... but strip it on save so that we're still safe
augroup vimBetterWhiteSpace
  autocmd FileType gitcommit autocmd BufWritePre <buffer> StripWhitespace
augroup END

" Use Solarized colors for highlighting
highlight Extrawhitespace ctermbg=red guibg=#dc322f

" --- neomake/neomake ---
let g:neomake_error_sign = {
    \ 'text': '✘',
    \ 'texthl': 'Error',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '▲',
    \ 'texthl': 'Todo',
    \ }

let g:neomake_open_list = 0

" Use neomake only as a dependency for other plugins. Otherwise, prefer ALE.
let g:ale_emit_conflict_warnings = 0

" --- dense-analysis/ale ---
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '▲'

let g:airline#extensions#ale#enabled = 1

" Open the loclist if there were errors
let g:ale_open_list = 1

" Only lint on save
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0

nnoremap <leader>et :ALEToggle<CR>
nnoremap <leader>ef :ALEFix<CR>

let g:ale_linters = {}
let g:ale_linters.tex = []
" We're using intero-neovim + Neomake for Haskell errors
let g:ale_linters.haskell = ['hlint']
" Use language server for Flow to try things out
let g:ale_linters.javascript = ['eslint']
" CSS warnings were mostly chunderous
let g:ale_linters.css = []
" rust-analyzer for Rust
" Source: https://rust-analyzer.github.io/manual.html#ale
let g:ale_linters.rust = ['analyzer']

" Be sure to never install 'prettier' globally, or you will be running
" prettier on all JavaScript files everywhere.
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['prettier', 'eslint']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.pandoc = ['prettier']
let g:ale_fixers.markdown = ['prettier']
let g:ale_fixers.scala = ['scalafmt']
let g:ale_fixers.haskell = ['brittany', 'stylish-haskell']
let g:ale_fixers.cpp = ['clang-format']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_rust_cargo_check_all_targets = 0

" Don't cd into folder first for shellcheck
let g:ale_sh_shellcheck_cd_buffer = 0

augroup aleMaps
  au FileType javascript let g:ale_fix_on_save = 1
  au FileType css let g:ale_fix_on_save = 1
  au FileType markdown let g:ale_fix_on_save = 1
  au FileType scala let g:ale_fix_on_save = 1
  au FileType haskell let g:ale_fix_on_save = 1

  au FileType javascript nnoremap <silent> <buffer> <leader>t :ALEHover<CR>
augroup END

" --- neovimhaskell/haskell-vim ---
let g:haskell_indent_case_alternative = 1
let g:haskell_indent_in = 0
let g:haskell_indent_let_no_in = 0
let g:haskell_indent_if = 2
let g:haskell_indent_before_where = 2
let g:haskell_classic_highlighting = 1

" --- sbdchd/neoformat ---
let g:neoformat_enabled_haskell = ['brittany', 'stylishhaskell']
augroup neoformatMaps
  au!
  " https://github.com/sbdchd/neoformat/issues/134
  au BufWritePre *.hs try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | silent Neoformat | endtry

  au FileType haskell let g:neoformat_run_all_formatters = 1
augroup END

" --- fzf ---
set runtimepath+=/usr/local/opt/fzf
nnoremap <C-P> :FZF<CR>

" <CR> to open in new tab, <C-E> for current buffer
let g:fzf_action = {
  \ 'ctrl-m': 'tabedit',
  \ 'ctrl-e': 'edit',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-s': 'split',
  \ 'ctrl-r': 'read',
\}

" --- mileszs/ack.vim ---
" Use ag instead
let g:ackprg = 'ag --nogroup --nocolor --column'

" --- parkr/vim-jekyll ---
let g:jekyll_post_suffix="md"

" --- majutsushi/tagbar ---
" Open/close tagbar with \b
nnoremap <silent> <leader>b :TagbarToggle<CR>

" Order tags based on file order; don't sort alphabetically
let g:tagbar_sort = 0
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" Treat .ts in Vim as .ts in ctags
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" Treat .ts in Vim as .js in ctags
"let g:tagbar_type_typescript = {
"  \ 'ctagstype': 'JavaScript',
"  \ 'kinds': [
"    \ 'f:functions',
"    \ 'c:classes',
"    \ 'm:members',
"    \ 'p:properties',
"    \ 'v:globals',
"  \ ]
"\ }

let g:tagbar_type_javascript = {
  \ 'ctagstype': 'js',
  \ 'replace': 1,
  \ 'ctagsbin': '~/bin/gtags',
  \ 'kinds': [
    \ 'c:class',
    \ 'm:method',
    \ 'p:property',
    \ 'f:function',
    \ 'o:object',
    \ 'n:constant',
  \ ],
\ }

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

