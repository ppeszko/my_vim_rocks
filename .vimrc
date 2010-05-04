" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader="\\"
let g:mapleader="\\"

" saving swp files in the tmp directory
let $VIMDATA  = $HOME.'/.vim/vimdata'
set backupdir=$VIMDATA/backup
set directory=$VIMDATA/tmp

" full screen is working on macvim
if has("gui_running")
  set fuoptions=maxvert,maxhorz
endif

" indention
set tabstop=2
set shiftwidth=2
set expandtab

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

set history=100		" keep 50 lines of command line history
set ruler		      " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch	  	" do incremental searching
set laststatus=2  " Always display the status line

" Numbers
set number
" set numberwidth=5

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full " adds popup menue for cmd completion
set complete=.,t

" set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)

" case only matters with mixed case expressions
set ignorecase
set smartcase
set paste

let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'

""""""""""""""""""""""""""""""
" miniBufferExplorer
""""""""""""""""""""""""""""""
let g:miniBufExplMapCTabSwitchBufs = 1
map <Leader>b :MiniBufExplorer<cr>
let g:miniBufExplMapWindowNavVim = 1


""""""""""""""""""""""""""""""
" taglist
""""""""""""""""""""""""""""""
let Tlist_Use_Right_Window = 1

""""""""""""""""""""""""""""""
" grep.vim
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = '.svn .git tmp'
let Grep_Skip_Files = 'tags .tmtags ctags'
let Grep_Default_Filelist = '*.rb *.erb'

let Grep_Default_Options = '-i'
if has("macunix") || has("gui_macvim")
  let Grep_Xargs_Options = '-0'
endif

""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
map <Leader>f :NERDTreeToggle<cr>
 
