" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Nov 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set backupdir=/tmp
  set dir=/tmp
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

set number

" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

let mapleader = "-"
let g:vim_arduino_serial_port = "/dev/ttyACM0"

"SPLITS!
map <C-J> <C-W>j
map <C-K> <C-W>k

map <C-H> <C-W>h
map <C-L> <C-W>l

set splitbelow
set splitright

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set laststatus=2
set noshowmode

" Omnicompletion
set omnifunc=syntaxcomplete#Complete

"set cursorline
function! s:set_cursor_line()
  hi CursorLine cterm=NONE ctermbg=16 guibg=darkgray term=none
  hi CursorColumn cterm=NONE ctermbg=16 guibg=darkgray
endfunction

set cursorline! cursorcolumn!
call s:set_cursor_line()

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "xelatex"

call plug#begin('~/.vim/plugged')

" GENERAL
Plug 'tpope/vim-surround'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-sleuth'

"Plug 'mhinz/vim-Startify' <-- May be reenabled in the future.

" ctags
Plug 'majutsushi/tagbar'

Plug 'terryma/vim-multiple-cursors'

" A E S T H E T I C S
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" misc utisl
Plug 'Rykka/colorv.vim'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

" LANGUAGES
Plug 'scrooloose/syntastic'
" C[++]
Plug 'sophacles/vim-processing'
"Plug 'justinmk/vim-syntax-extra'

" Handlebars/mustache
Plug 'mustache/vim-mustache-handlebars'

" JS
Plug 'ternjs/tern_for_vim'
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

" LaTeX
Plug 'vim-latex/vim-latex'

" Coffee
Plug 'kchmck/vim-coffee-script'

call plug#end()

execute pathogen#infect()

" NERD Tree
nmap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeMouseMode = 1
let g:nerdtree_tabs_open_on_console_startup = 0
nmap <leader>E :NERDTreeTabsToggle<CR>


nmap <F8> :TagbarToggle<CR>
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

"AIRLINE
let g:airline_powerline_fonts = 1
let g:airline_theme='term'
let g:airline#extensions#tabline#enabled = 1

"SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

let g:limelight_conceal_ctermfg = 'Gray'
let g:limelight_conceal_guifg = '#D47F35'
nmap <f2> :Goyo<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
autocmd! ColorScheme * call s:set_cursor_line()

" neocomplete
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" imap <expr><BS> neocomplete#smart_close_popup()."\<C-h>" \| <Plug>delimitMateBS
inoremap <expr> <BS>  pumvisible() ? neocomplete#smart_close_popup()."\<BS>" : delimitMate#BS()
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType markdown NeoCompleteLock
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.javascript =
      \ '\h\w*\|[^. \t]\.\w*'

" (Xe)?(La)?TeX word count
:map <F3> :w !detex \| wc -w<CR>

" Compile XeLaTeX
function CompileXeLaTex()
    let oldCompileRule=g:Tex_CompileRule_pdf
    let g:Tex_CompileRule_pdf = 'xelatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
    call Tex_RunLaTeX()
    let g:Tex_CompileRule_pdf=oldCompileRule
endfunction
map <Leader>lx :<C-U>call CompileXeLaTex()<CR>

let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0,
\ }

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
