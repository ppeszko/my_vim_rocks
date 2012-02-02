" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype plugin indent on

" mapping
let mapleader="\\"
let g:mapleader="\\"
" Hide search highlighting
map <Leader>h :set invhls <CR>
"map <leader>t :FuzzyFinderTextMate<CR>
map <leader>t :CommandT<CR>
"map <leader>y :CommandTFlush<CR>
map <leader>c :!/Users/comes/.rvm/rubies/ruby-1.9.2-p180/bin/ruby -c %<CR>
map <leader>a :TlistToggle<CR>

" saving swp files in the tmp directory
let $VIMDATA  = $HOME.'/.vim/vimdata'
set backupdir=$VIMDATA/backup
set directory=$VIMDATA/tmp

" NOT WROKING
" Maps autocomplete to tab
" imap <Tab> <C-N>
" Snippets are activated by Shift+Tab
" let g:snippetsEmu_key = "<S-Tab>"


" full screen is working on macvim
if has("gui_running")
  set fuoptions=maxvert,maxhorz
  set guioptions-=T
endif

" indention
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" highlights all matches
set hlsearch

" colors
" colorscheme molokai
" colorscheme github
syntax enable
colorscheme solarized
" GRB: set the color scheme
:set t_Co=256 " 256 colors
:set background=dark
":color grb256

" show whitespaces
if has("gui_running")
  set listchars=tab:>−,trail:−
endif
"map <Leader>sw :set list<CR>
"map <Leader>nw :set nolist<CR>
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
nnoremap <Leader>sw :match ExtraWhitespace /\t/<CR>
nnoremap <Leader>nw :match<CR>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set history=1000	" keep 1000 lines of command line history
set winwidth=120
set ruler		      " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch	  	" do incremental searching
set laststatus=2  " Always display the status line
set scrolloff=7   " minimal screen lines above/below cursor
set cmdheight=2   " use 1 screen lines for command-line
set lazyredraw    " redraw while executing macros (for qbuf)
set guifont=Inconsolata:h14
" highlight current line
set cursorline

" Numbers
set number
" set numberwidth=5

" copy&paste for vim (as in MacVim)
map <silent> <leader>y :<C-u>silent '<,'>w !pbcopy<CR>

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set wildmode=longest,list " adds popup menue for cmd completion
set completeopt=menu
set complete=.,t
set ofu=syntaxcomplete#Complete

" set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
:hi Search gui=underline
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

" case only matters with mixed case expressions
set ignorecase
set smartcase
set paste

let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_WinWidth = 70
let Tlist_Show_One_File = 1

""""""""""""""""""""""""""""""
" miniBufferExplorer
""""""""""""""""""""""""""""""
"let g:miniBufExplMapCTabSwitchBufs = 1
"map <Leader>b :MiniBufExplorer<cr>
"let g:miniBufExplMapWindowNavVim = 1

""""""""""""""""""""""""""""""
" QuickBuffer
""""""""""""""""""""""""""""""
noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l


""""""""""""""""""""""""""""""
" taglist
""""""""""""""""""""""""""""""
let Tlist_Use_Right_Window = 1

""""""""""""""""""""""""""""""
" grep.vim
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = '.svn .git tmp .bundle'
let Grep_Skip_Files = 'tags .tmtags ctags'
let Grep_Default_Filelist = '*.rb *.erb *.haml'

" making command-t faster
set wildignore+=*.o,*.obj,.git
let g:CommandTMaxHeight=15

let Grep_Default_Options = '-i'
if has("macunix") || has("gui_macvim")
  let Grep_Xargs_Options = '-0'
endif
map <Leader>r :Rgrep<cr>

""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
map <Leader>e :NERDTreeToggle<cr>

" autocomands
autocmd BufWritePre * :%s/\s\+$//e
" Auto-close fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"""""""""""""""""""""""""""""
" Syntasic
"""""""""""""""""""""""""""""
let g:syntastic_auto_loc_list=1
