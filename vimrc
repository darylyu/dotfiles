set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set ignorecase
set smartcase
set nostartofline
set expandtab

" always display the status line
set laststatus=2
" show the line number
set ruler
" disable visual bell
set t_vb=
" always show the current cursor position
set number
" enable mouse for all modes
set mouse=a

" keyboard mappings
map [ : tabp <cr>
map ] : tabnext <cr>

map <C-\> :rightbelow split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-\> :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>
map <F5> :Tlist<CR>

set tags=./tags;/
set wrap
"autocmd BufWritePre *.rby :%s/\s\+$//e
