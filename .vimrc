" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" clipboard
" -----------------------------------------------------------------------------
" use the system clipboard as the default register
set clipboard=unnamed,unnamedplus

filetype plugin indent on
" mapping
let mapleader="\\"
let g:mapleader="\\"
" Hide search highlighting
:nnoremap <Leader>h :nohlsearch<cr>
"map <leader>t :FuzzyFinderTextMate<CR>
map <leader>t :CtrlPTag<CR>
map <leader>p :CtrlPMixed<CR>
map <leader>o :only<CR>
map <leader>c :cclose<CR>

" saving swp files in the tmp directory
let $VIMDATA  = $HOME.'/.vim/vimdata'
set backupdir=$VIMDATA/backup
set directory=/tmp

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
set t_Co=256 " 256 colors
"let g:solarized_termcolors=256      " use solarized 256 fallback
set background=dark
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
" Clear the search buffer when hitting return

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set encoding=utf-8
set history=1000	" keep 1000 lines of command line history
set winwidth=120
set ruler		      " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch	  	" do incremental searching
set laststatus=2  " Always display the status line
set scrolloff=7   " minimal screen lines above/below cursor
set cmdheight=2   " use 1 screen lines for command-line
set lazyredraw    " redraw while executing macros (for qbuf)
"set guifont=Inconsolata:h14
"set guifont=SourceCodePro-Regular:h14
set guifont=SourceCodePro-Medium:h14
" highlight current line
set cursorline
set backspace=indent,eol,start

"" Modern command line
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" Numbers
set number
" set numberwidth=5

" copy&paste for vim (as in MacVim)
"map <silent> <leader>y :<C-u>silent '<,'>w !pbcopy<CR>
map <silent> <leader>y "+y

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
"set wildmode=longest,list " adds popup menue for cmd completion
"set completeopt=menu
set complete=.,w,b,u,t
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone
set wildmode=list:longest,list:full

" set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)
"set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}%-4(%m%)%=%-19(%3l,%02c%03V%)
hi Search gui=underline
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

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
set wildignore+=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildignore+=*.o,*.obj,.git
let g:CommandTMaxHeight=15

let Grep_Default_Options = '-i'
if has("macunix") || has("gui_macvim")
  let Grep_Xargs_Options = '-0'
endif
map <Leader>r :Rgrep<cr>

" copying file path to clipboard
map <Leader>% :let @* = expand("%")<cr>

""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
nmap <leader>f :NERDTreeFind<CR>
map <Leader>e :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""
" GitGutter
""""""""""""""""""""""""""""""
nmap <leader>g :GitGutterToggle<CR>
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  nmap <leader>a :Ag -p .gitignore
endif

" autocomands
autocmd BufWritePre * :%s/\s\+$//e
" Auto-close fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" open new file in new buffer rather the in new tab
"autocmd BufWinEnter,BufNewFile * silent tabo

" trying to fix the problem when auto indentation is lost
au BufRead * set  autoindent cindent smartindent
au BufRead * filetype plugin indent on

"""""""""""""""""""""""""""""
" autocmds from destroy all software https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
augroup END

"""""""""""""""""""""""""""""
" Syntasic
"""""""""""""""""""""""""""""
let g:syntastic_auto_loc_list=1

"""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""
let g:ctrlp_extensions = ['tag', 'changes', 'dir', 'undo']
let g:ctrlp_working_path_mode = 0

"""""""""""""""""""""""""""""
" Dash integration
"""""""""""""""""""""""""""""
" Search Dash for word under cursor
function! SearchDash()
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = "dash://".s:wordUnderCursor
  let s:cmd ="silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <leader>d :call SearchDash()<CR>

" airline

let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=1
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" vimux-ruby-test
let g:vimux_ruby_cmd_unit_test = "z test"
let g:vimux_ruby_cmd_all_tests = "z test"
map <leader>zz :RunRubyFocusedTest<CR>
map <leader>za :RunAllRubyTests<CR>
