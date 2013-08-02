execute pathogen#infect()

let mapleader = ','
let g:EasyMotion_leader_key = '<Leader>'
let g:airline_enable_syntastic=1
let g:signify_vcs_list = [ 'git', 'hg' ]

set showmode
set nocompatible
set encoding=utf-8
set t_Co=256

" This makes RVM work inside Vim. I have no idea why.
set shell=bash

syntax on
filetype plugin on
filetype plugin indent on
filetype indent on

" zencoding-vim
let g:user_zen_expandabbr_key = '<C-e>'

" ctrlp
let g:ctrlp_working_path_mode = ''

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.DS_Store$']

map <C-n> :NERDTreeToggle<CR>
map <F8> :NERDTreeToggle<CR>

map <Leader>s :call StripWhitespace ()<CR>"
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly

" Colours and theme stuffs."
color distinguished
set guifont=Monaco:h12
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands

" tabbage"
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set ai
set si


" Usability info"
set incsearch
set number
set title
set showcmd
set cursorline

set pastetoggle=<F2>

" Strip trailing whitespace
function! StripWhitespace ()
  exec ':%s/ \+$//gc'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>


"commands remap"
:command WQ wq
:command Wq wq
:command W wall
:command Q q

"Custom mappings
map <F7> mzgg=G`z<CR>

nmap :qq :q!
nmap qq :q!<CR>
nmap ri<Leader> mzgg=G`z
nmap <C-p> :CtrlP<CR>"
nmap G Gzz
nmap n nzz
nmap N nzz
nmap } }zz
nmap { {zz

"Pane nav"
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

imap <Tab> <C-N>
imap <C-L> <Space>=><Space>

au BufRead,BufNewFile *.php set ft=php.html
au BufRead,BufNewFile *.html.erb set ft=eruby.html
