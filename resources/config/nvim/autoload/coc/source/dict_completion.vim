" vim source for dict_completions
function! coc#source#dict_completion#init() abort
  return {
    \'filetypes': ['', 'markdown', 'text'],
    \'shortcut': 'DIC',
    \}
endfunction

let s:coc_dict_completion_fn = expand('<sfile>:p:h') . '/all_words'
let s:coc_dict_completion_items = readfile(s:coc_dict_completion_fn)

function! coc#source#dict_completion#complete(opt, cb) abort
  call a:cb(s:coc_dict_completion_items)
endfunction

