" Colour Scheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Airline
let g:airline_theme='dracula'
let g:airline_powerline_fonts=1
