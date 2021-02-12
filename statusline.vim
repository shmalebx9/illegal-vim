
function! WordCount()
return " " . wordcount().words
endfunction

" Better filename taken from somewhere in the wind
function! StatusFilename()
  let name = ""
  let subs = split(expand('%'), "/")
  let i = 1
  for s in subs
    let parent = name
    if  i == len(subs)
      let name = len(parent) > 0 ? parent . '  ' . s : s
    elseif i == 1
      let name = s
    elseif i < 7
      let part = strpart(s, 0, 10)
      let name = len(parent) > 0 ? parent . '  ' . part : part
    endif
    let i += 1
  endfor
  return name
endfunction

let g:crystalline_tab_mod = ' '
function! TabLine()
  return crystalline#bufferline(0, 0, 1)
endfunction

function Setstatuscolors()
" colorscheme backgrond color
 let csbg = synIDattr(hlID("Normal"), "bg")

" colorscheme main colors
 let fg1 = synIDattr(hlID("Constant"), "fg")
 let fg2 = synIDattr(hlID("Float"), "fg")
 let fg3 = synIDattr(hlID("Function"), "fg")
 let fg4 = synIDattr(hlID("Operator"), "fg")
 let fg5 = synIDattr(hlID("Keyword"), "fg")

 exe 'hi StatusLine guifg=' . csbg . ' guibg=' . csbg
 exe 'hi User1 guifg=' . csbg . ' guibg=' . fg1
 exe 'hi User2 guifg=' . csbg . ' guibg=' . fg2 
 exe 'hi User3 guifg=' . csbg . ' guibg=' . fg3 
 exe 'hi User4 guifg=' . csbg . ' guibg=' . fg4 
 hi User5 guifg=NONE guibg=NONE

 exe 'hi User6 guibg=' . fg2 . ' guifg=' . fg1
 exe 'hi User7 guibg=NONE guifg=' . fg2
 exe 'hi User8 guibg=NONE guifg=' . fg3
 exe 'hi User9 guibg=' . fg3 . ' guifg=' . fg4
 exe 'hi User10 guifg=' . fg5 . ' guibg=' . fg4 
 exe 'hi! CrystallineTabFill guibg= ' . csbg
endfunction

silent call Setstatuscolors()

set statusline=%1*\ %{nerdfont#find()}\ %6*%2*\ %{StatusFilename()}\ %7*%5*\ %=%8*%3*\ \ %l\/%L\ %9*%4*\ %{WordCount()}\  

let g:crystalline_enable_sep = 1
"let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'onedark'

" to handle exiting insert mode via a control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>
set showtabline=2
set laststatus=2
