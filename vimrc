" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif
  call vam#ActivateAddons([], {'auto_install' : 0})
endfun

call SetupVAM()
" Install vim-nox so you can run Command-T on Linux
VAMActivate matchit.zip vim-addon-commenting The_NERD_tree Supertab Command-T
" use <c-x><c-p> to complete plugin names


:set encoding=utf-8
:set fileencoding=utf-8

:hi CursorLine   cterm=NONE ctermbg=darkgray
:set cursorline

set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set ignorecase
set smartcase
set nostartofline
set expandtab
set hlsearch

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
map <leader>n : execute 'NERDTreeToggle'<CR>

autocmd BufWritePre * :%s/\s\+$//e
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab

map <C-\> :rightbelow split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-\> :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>
map <F5> :Tlist<CR>

set tags=./tags;/
set wrap
"autocmd BufWritePre *.rby :%s/\s\+$//e

" NERD Tree settings
let NERDTreeIgnore = ['\.pyc$']
