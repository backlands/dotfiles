" Save our swap and history files to ~/.vimdata, to keep the working dir clean
set directory=~/.config/nvim/swap// " // at the end sets the filename to full path, to ensure uniqueness
set undodir=~/.config/nvim/undo
set undofile " Save our undo history to a file when writing a file - Saves to undodir

filetype plugin indent on " Additional detection of filetypes
set encoding=utf-8
set ttyfast " We have a fast terminal connection, so send more at once

" Airline
set noshowmode

" Fix ttimeoutlen for exiting insert mode with Airline
set ttimeoutlen=50

" Disable the mouse
set mouse =

" Watch ~/.vimrc and reload on change
augroup watchvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Blank startify cowsay
let g:startify_custom_header = []

" Set NerdTree shortcut
map <C-n> :NERDTreeToggle<CR>
