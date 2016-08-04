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

"set cursorline
hi CursorLine cterm=NONE ctermbg=16 guibg=darkgray
hi CursorColumn cterm=NONE ctermbg=16 guibg=darkgray
set cursorline! cursorcolumn!

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "xelatex"

call plug#begin('~/.vim/plugged')

" GENERAL
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-sleuth'

" UI
Plug 'mhinz/vim-Startify'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'chrisbra/unicode.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'bling/vim-airline'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
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

" JS
Plug 'maksimr/vim-jsbeautify'

" Handlebars/mustache
Plug 'mustache/vim-mustache-handlebars'

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

"SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let delimitMate_expand_cr = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:limelight_conceal_ctermfg = 'Gray'
let g:limelight_conceal_guifg = '#D47F35'
nmap <f2> :Goyo<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

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

" JS Beautify
autocmd FileType javascript noremap <buffer>  <Leader>j :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <Leader>j :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <Leader>j :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <Leader>j :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <Leader>j :call CSSBeautify()<cr>
