call plug#begin()
Plug 'skywind3000/asyncrun.vim'		" Build system
Plug 'mcchrish/nnn.vim'			" nnn file picker
Plug 'kamykn/spelunker.vim'		" Spell checker
Plug 'kamykn/popup-menu.nvim'		" Pmenu
Plug 'junegunn/fzf.vim'			" Provides History
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rbong/vim-crystalline'
Plug 'lambdalisue/nerdfont.vim'
" Colorschemes
 Plug 'NieTiger/halcyon-neovim'
 Plug 'drewtempelmeyer/palenight.vim'
 Plug 'davidklsn/vim-sialoquent'
 Plug 'liuchengxu/space-vim-dark'
 Plug 'jdsimcoe/abstract.vim'
 Plug 'equt/paper.vim'
 Plug 'chuling/equinusocio-material.vim'
 Plug 'jdsimcoe/hyper.vim'
 Plug 'AhmedAbdulrahman/vim-aylin'
 Plug 'heraldofsolace/nisha-vim'
 Plug 'awinecki/amy-vim-coloscheme'
 Plug 'joshdick/onedark.vim'
 Plug 'ayu-theme/ayu-vim'
 Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'wadackel/vim-dogrun'
Plug 'marcelbeumer/spacedust.vim'
call plug#end()

" Basic config
set number relativenumber		" See line distance from current line
set wrap linebreak			" Wrap lines virtually
let mapleader=" "			" Set leader key to space bar
set mouse=a        			" Allow mouse
set encoding=utf-8			" Encoding
"set ignorecase                    	" Include matching uppercase words with lowercase search term
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
set scrolloff=5				" Get context lines in search
set sessionoptions+=localoptions	" Keep syntax highlighting
set termguicolors
let g:palenight_terminal_italics=1
let ayucolor="mirage"
so ~/.config/nvim/statusline.vim
so ~/.config/nvim/compl.vim

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

function EnterMarkdown()
 setlocal spell spelllang=en_ca
 setlocal dict=~/.local/share/words/wordlist
 "setlocal complete+=k
 setlocal noignorecase
endfunction

" Spelling
map <leader>o :setlocal spell! spelllang=en<CR>
nnoremap <c-u> :normal Zl<CR>
inoremap <c-u> <Esc>:normal Zl<CR>

" UI Keybinds
noremap <C-w> :bd<CR> 
nnoremap <C-PageUp>   :bp!<CR>
nnoremap <C-PageDown> :bn!<CR>
nnoremap <C-n>	    :tabnew<CR>" New tab
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y 
inoremap <c-s> <Esc>:update<CR>a
nnoremap <c-s> :update<CR>

" FZF Keybinds
let g:fzf_action = {
  \ 'ctrl-m': 'tabedit',
  \ 'ctrl-o': 'e',
  \ 'ctrl-t': 'tabedit',
  \ 'ctrl-h':  'botright split',
  \ 'ctrl-v':  'vertical botright split' }
nnoremap <c-p> :FZF<CR>
nnoremap <m-p> :History<CR>
"
" Markdown keybinds
autocmd filetype markdown silent call EnterMarkdown() 
noremap <m-b> <Esc>:AsyncRun methodius -m -nd %:p<CR>
inoremap <C-b> **
inoremap <C-t> <CR>+ 
"
" Law helpers
function Firac()
 echo "**Facts:**\n\n\n**Issue:**\n\n\n**Rule:**\n\n\n**Analysis:**\n\n\n**Conclusion:**\n"
endfunction
inoremap <m-a> <Esc>:put = execute('call Firac()')<CR><Esc>12k<CR>i
inoremap <m-e> <Esc>/\*\*....<CR>ji

