Plug 'paretje/deoplete-notmuch', {'for': 'mail'}

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Max items in completion menu
call deoplete#custom#option('max_list', 5)
" Spelling
set complete+=kspell
set dict=~/.local/share/words/wordlist

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:deoplete#sources#notmuch#command = ['notmuch', 'address', '--format=json', '--deduplicate=address', '*']



