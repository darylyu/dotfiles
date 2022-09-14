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
VAMActivate matchit.zip vim-addon-commenting The_NERD_tree Supertab surround github:junegunn/fzf github:vim-syntastic/syntastic github:majutsushi/tagbar vim-airline github:vim-airline/vim-airline-themes
" use <c-x><c-p> to complete plugin names

set autoindent
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
set ignorecase
set laststatus=2  " always display the status line
set mouse=a  " enable mouse for all modes
set nostartofline
set number  " always show the current cursor position
set ruler  " show the line number
set shiftwidth=4
set smartcase
set softtabstop=4
set t_vb=  " disable visual bell
set tabstop=4
set tags=./tags;/
set wildignore+=*.pyc,**/node_modules/*,**/bower_components/*,**htmlcov/*,**static/*
set wrap
set cursorline
set noerrorbells
set visualbell  " This is for PyCharm https://superuser.com/questions/622898/how-to-turn-off-the-bell-sound-in-intellij

" Allow smart join in PyCharm
" We do a check here so that plain Vim doesn't raise an error.
if exists("&ideajoin")
      :set ideajoin
endif

highlight Cursorline cterm=bold

" keyboard mappings
map <A-\> :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :rightbelow split<CR>:exec("tag ".expand("<cword>"))<CR>
map <leader>P : execute 'set nopaste'<CR>
map <leader>T : TagbarToggle<CR>
map <leader>n : execute 'NERDTreeToggle'<CR>
map <leader>p : execute 'set paste'<CR>
map <leader>q : q<CR>
map <leader>s : w<CR>
map <leader>t : execute 'FZF'<CR>

" coding conventions settings
autocmd BufWritePre * :%s/\s\+$//e
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype js setlocal ts=2 sw=2 sts=2 expandtab

" syntastic settings
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height=0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']

" vim-airline + tagbar show class name and method name
let g:airline#extensions#tagbar#flags = 'f'  " show full tag hierarchy

" match airline's theme with shell's theme
let g:airline_theme='solarized'


" NERD Tree settings
let NERDTreeIgnore = ['\.pyc$', 'bower_components', 'node_modules', 'dist$', '__pycache__', 'celerybeat-schedule', '\.retry$', 'htmlcov', '\.bak$']
let g:vim_addon_commenting = {'force_filetype_comments': {'php': ['#',''], 'c' : ['/*','*/']}}
