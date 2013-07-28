" plugins
call pathogen#infect()
filetype plugin indent on

" environment
set colorcolumn=80
set cursorline
set encoding=utf8
set list
set listchars=tab:»·,trail:·,nbsp:·
set number
syntax on
colorscheme twilight

" editor
set backspace=2
set expandtab
set incsearch
set shiftwidth=2
set tabstop=2

" show hidden files in filesystem tree
let NERDTreeShowHidden=1

" disable matchparen plugin
let loaded_matchparen=1

" mappings
noremap <C-b> <Leader>ci
inoremap <C-b> <Esc><Leader>cili

noremap <C-n> :NERDTreeToggle<CR>

noremap <C-o> :set nonumber!<CR>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <Tab> >>
inoremap <Tab> <C-t>
vnoremap <Tab> >gv

noremap <S-Tab> <<
inoremap <S-Tab> <C-d>
vnoremap <S-Tab> <gv

" trim trailing spaces before save
autocmd BufWritePre * :%s/\s\+$//e

" open filesystem tree if vim opened without arguments
autocmd vimenter * if !argc() | NERDTree | endif

" close vim if opened only filesystem tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
