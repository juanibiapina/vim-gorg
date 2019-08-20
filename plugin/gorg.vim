if exists("g:loaded_gorg") || &cp
  finish
endif
let g:loaded_gorg = 1

nnoremap <Plug>GorgOpenIndex :edit index.md<CR>
