call plug#begin()

Plug 'kien/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mhinz/vim-startify'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer --cs-completer --go-completer' }

call plug#end()
filetype plugin indent on

" Set color theme:
syntax enable
colorscheme monokai


" UI CONFIG:
set number 		            " Show line number for every file 
set showcmd 	            " show command in bottom bar                             	
set cursorline 		        " highlight current line
filetype indent on 	        " load filetype-specifiv indent file configure this later
set wildmenu		        " visual autocomplete for command menu
" :ls to see listing directories
" :b  to change entered file
set showmatch       " highlight matching [{()}]
set lazyredraw          " redraw only when we need to.


" SEARCHING:
set incsearch           	" search as characters are entered
set hlsearch            	" highlight matches<Paste>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


" TAG JUMPING:
" Create the `tags` file (may need to isntall ctags first)
command! MakeTags !ctags -R .
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jupm back up the tag stack
" THINGS TO CONSIDER:
" - This doesn't help if you a visual list of tags


" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenemes (works with out path trick!)
" - ^x^] for tags only
" - ^n   for anything specified by the 'complete' option
" NOW WE CAN:
" - Use ^n and ^p to go back in the suggestion list 


" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**


" SPACES AND TABS:
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolloff=5
set autoindent
set smartindent


" RAINBOW PARENTHESES:
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" CLOSE BRACKETS ETC:
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Lightline: settins
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }


" NordTree: settings
set modifiable
map <C-o> :NERDTreeToggle<CR>

" Vim-gitgutter: Settings
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk

" vim-javascript: config

" YouAutoComplete: config
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
