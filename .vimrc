call plug#begin()
Plug 'mcchrish/nnn.vim'		" nnn file picker
Plug 'ayu-theme/ayu-vim'        " Ayu colorscheme
Plug 'kamykn/spelunker.vim'	" Spell checker
call plug#end()

set mouse=a         " Allow mouse
set ruler           " Always show current position
syntax on           " Turn on syntax highlighting.
set lazyredraw      " Don't redraw while executing macros
set number	    " Show line numbers
set incsearch	    " Allow incremental search
set guifont=FiraCode\ Nerd\ Font\ 16

" Set sane wrapping
set wrap linebreak
set showtabline=2


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

let ayucolor="mirage" " colorscheme
colo ayu
set laststatus=2      " Set status line to show

" Disable feckless gvim bars
set guioptions -=m
set guioptions -=T
set guioptions -=r
set guioptions -=L

function Gcolors()
 hi User1 guifg=black guibg=#a1dbb2
 hi User2 guifg=NONE guibg=NONE
 hi User3 guifg=black guibg=#fee5ad
 hi User4 guifg=#1e1e1e guibg=#ffc966
 hi User5 guifg=#2e2e2e guibg=#f7a541
 hi User6 guifg=black guibg=#f45d4c
endfunction

function! GuiTabLabel() " Quick and dirty change to gvim modified indicator
 let label = ''
 let bufnrlist = tabpagebuflist(v:lnum)
  for bufnr in bufnrlist
   if getbufvar(bufnr, "&modified")
    let label = ' '
    break
   endif
  endfor
 return label
endfunction

set guitablabel=%t%{GuiTabLabel()}

silent call Gcolors()

set statusline=""
set statusline+=\ %{StatusFilename()}\ %1*\ %y " Path & file type
set statusline+=\ %2*%=                        " Switch to right-side
set statusline+=%4*\ \ %l\ /\ %L              " Lines
set statusline+=\ %5*\ 龎\ %=%{WordCount()}\   " words 

set encoding=utf-8 		   " Encoding
set ignorecase                     " Include matching uppercase words with lowercase search term
set smartcase 			   " Include only uppercase words with uppercase search term
set viminfo='100,<9999,s100        " 100kb of data. Useful for copying large amounts of data between files. 
set noerrorbells visualbell t_vb=  " Disable audiobell

" Disable line nubers for markdown and LaTex
autocmd FileType rmd setlocal nonumber
autocmd FileType md setlocal nonumber
autocmd FileType txt setlocal nonumber
autocmd FileType tex setlocal nonumber

" Grab wordcount
function! WordCount()
  let s:word_count = ""
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe ":silent normal g\<c-g>"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    if stat =~ "^Selected"
      let s:word_count = str2nr(split(v:statusmsg)[5])
    else
      let s:word_count = str2nr(split(v:statusmsg)[11])
    end
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  return s:word_count 
endfunction

" Save session on close and restore session & colors on open
function Onenter()
 source ~/.vim/shutdown_session.vim
 silent call Gcolors()
endfunction
autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim
autocmd VimEnter * silent call Onenter()

set undofile
set undodir=$HOME/Documents/.bkup/undo
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" File picker options
let g:nnn#set_default_mappings = 0
set hidden
let g:nnn#layout = { 'left': '~35%' } " Open left taking 35% 
let g:nnn#command = 'nnn -neHJA'      " NNN command
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-V>': 'vsplit' }	      " Self-explanatory
nnoremap <C-o> :NnnPicker %:p:h<CR>
inoremap <C-o> <Esc>:NnnPicker %:p:h<CR>
" Hint: to escape file viewer hit <Esc>q

" Spell checking
set spelllang=en_ca				" Set to your locale
set nospell					" Turn off default spell check
let g:enable_spelunker_vim = 1			" Enable Spellunker
let g:spelunker_max_suggest_words = 10		" Show 10 words in correction menu
let g:spelunker_max_hi_words_each_buf = 10	" Don't highlight too many words
let g:spelunker_check_type = 2			" Keep checking while you write
let g:spelunker_highlight_type = 2		" Only highlight mistakes 
highlight SpelunkerSpellBad gui=underline guifg=#f45d4c

" UI Keybinds
noremap <C-w> :q<CR> 		 " Close tab 
nnoremap <PageUp>   :tabnext<CR> " Next tab
nnoremap <PageDown> :tabprev<CR> " Prev tab
nnoremap <C-n>	    :tabnew<CR>  " New tab
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y		 " Copy to regular clipboard
inoremap <c-s> <Esc>:w<CR>
nnoremap <c-s> :w<CR>a

" Insert Keybinds
inoremap <C-b> **
inoremap <C-t> <CR>+ 
noremap <C-c> "+y
inoremap <c-s> <Esc>:w<CR>a
nnoremap <c-s> :w<CR>a
