let s:fontsize = 16

"GuiFont! Liga Source Code Pro:h11
execute "GuiFont! Iosevka Fixed:h" . s:fontsize

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  ":execute "GuiFont! Consolas:h" . s:fontsize
  :execute "GuiFont! Liga Source Code Pro:h" . s:fontsize
endfunction
