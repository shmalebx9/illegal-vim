call plug#begin()
Plug 'skywind3000/asyncrun.vim'
Plug 'itchyny/lightline.vim'
Plug 'mcchrish/nnn.vim'			" nnn file picker
Plug 'kamykn/spelunker.vim'		" Spell checker
Plug 'kamykn/popup-menu.nvim'
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

" Basic config
set number relativenumber		" See line distance from current line
set wrap linebreak			" Wrap lines virtually
let mapleader=" "			" Set leader key to space bar
set mouse=a        			" Allow mouse
set encoding=utf-8			" Encoding
set ignorecase                    	" Include matching uppercase words with lowercase search term
set smartcase 			  	" Include only uppercase words with uppercase search term
set viminfo='100,<9999,s100        	" 100kb of data. Useful for copying large amounts of data between files. 
set noerrorbells visualbell t_vb=	" Disable audiobell
set undofile
set undodir=$HOME/Documents/.bkup/undo
set undolevels=1000         		" How many undos
set undoreload=10000        		" number of lines to save for undo
colo palenight				" Colorscheme
filetype plugin on
set splitbelow splitright		" Logical splits
set wildmode=longest,list,full		" Auto-complete

" Better filename taken from somewhere in the wind
function! StatusFilename()
  let name = ""
  let subs = split(expand('%'), "/")
  let i = 1
  for s in subs
    let parent = name
    if  i == len(subs)
      let name = len(parent) > 0 ? parent . '/' . s : s
    elseif i == 1
      let name = s
    else
      let part = strpart(s, 0, 10)
      let name = len(parent) > 0 ? parent . '/' . part : part
    endif
    let i += 1
  endfor
  return name
endfunction

function! LightLineWordCount()
return "龎" . wordcount().words
endfunction

set showtabline=2
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', ],
      \             [ 'StatusFilename', ] ],
      \   'right': [ [ 'line', 'wordcount' ], ]
      \ },
      \ 'component_function': {
      \   'StatusFilename': 'StatusFilename', 
	\ 'wordcount': 'LightLineWordCount',
	\ },
      \ 'component': {
      \   'line': '%3l/%L', },
      \ }
" NNN opens with Ctrl+o, then the keybinds specified
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'left': '~35%' }
let g:nnn#command = "NNN_FCOLORS='c1e2d6dbe76033f7c6d6abc4' nnn -neHJA"
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-V>': 'vsplit' }
nnoremap <C-o> :NnnPicker %:p:h<CR>
inoremap <C-o> <Esc>:NnnPicker %:p:h<CR>

" Save session on close and restore session & colors on open
function Onenter()
 source ~/.vim/shutdown_session_nvim.vim
 filetype detect
endfunction
autocmd VimLeave * mksession! ~/.vim/shutdown_session_nvim.vim
autocmd VimEnter * silent call Onenter()

" Spelling
map <leader>o :setlocal spell! spelllang=en_ca<CR>
nnoremap <c-u> :normal Zl<CR>
inoremap <c-u> <Esc>:normal Zl<CR>

" UI Keybinds
noremap <C-w> :bd<CR> 
nnoremap <C-PageUp>   :tabprev<CR>
nnoremap <C-PageDown> :tabnext<CR>
nnoremap <C-n>	    :tabnew<CR>" New tab
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y 
inoremap <c-s> <Esc>:w<CR><CR>
nnoremap <c-s> :w<CR>:a
nnoremap <silent> <C-S> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

" Markdown keybinds
noremap <m-b> <Esc>:AsyncRun methodius -nd %:p<CR>
inoremap <C-b> **
inoremap <C-t> <CR>+ 

" Law helpers
function Firac()
 echo "**Facts:**\n\n\n**Issue:**\n\n\n**Rule:**\n\n\n**Analysis:**\n\n\n**Conclusion:**\n"
endfunction
inoremap <m-a> <Esc>:put = execute('call Firac()')<CR><Esc>12k<CR>i
inoremap <m-e> <Esc>/\*\*<CR>ji
