set ignorecase
set smartcase

let mapleader="\\"
let g:mapleader="\\"

" saving swp files in the tmp directory
let $VIMDATA  = $HOME.'/.vim/vimdata'
set backupdir=$VIMDATA/backup
set directory=$VIMDATA/tmp

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

