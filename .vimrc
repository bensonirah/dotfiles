set encoding=UTF-8
set number
set background=dark
set relativenumber
set ts=4 sw=4
set guifont=FiraCode\ 11
set autoread

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
  Plug 'junegunn/seoul256.vim'
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
  Plug 'bensonirah/nord-vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()


autocmd vimenter * ++nested colorscheme nord

nnoremap <c-p> :FZF<CR>
nnoremap <c-t> :NERDTreeToggle<CR>
let g:airline_powerline_fonts = 1

packloadall
