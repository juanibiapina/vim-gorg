if exists("g:loaded_gorg") || &cp
  finish
endif
let g:loaded_gorg = 1

nnoremap <Plug>GorgOpenIndex :edit index.md<CR>
nnoremap <Plug>GorgMoveDone :call <SID>move_to_done()<CR>

" Move current line to done file for current day
function! s:move_to_done()
  let line = getline(".")
  let current_date = strftime("%Y-%m-%d")

  call mkdir("done", "p")

  exec "silent ! echo " . "\"" . line . "\"" . " >> done/" . current_date . ".md"

  call deletebufline(bufname("%"), line("."))
endfunction

command! -nargs=1 -bar GorgOpenFile edit <args>
