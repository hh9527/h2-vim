if exists('g:loaded_unite')
  call unite#custom#profile('default', 'context', {'start_insert': 1, 'direction': 'botright', 'prompt_direction': 'top'})
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  function! s:usetting()
    imap <buffer> <C-J> <Plug>(unite_select_next_line)
    imap <buffer> <C-K> <Plug>(unite_select_previous_line)
    imap <buffer> <ESC> <Plug>(unite_exit)
  endfunction
  au FileType unite call s:usetting()
  nnoremap <C-P> :<C-U>UniteWithProjectDir buffer file_rec/async:!<CR>
  nnoremap <C-J><C-H> :<C-U>Unite outline<CR>
  nnoremap <C-J><C-K> :<C-U>Unite tag tag/include<CR>
  nnoremap <C-K><C-K> :<C-U>UniteWithCursorWord tag tag/include<CR>
  nnoremap <C-L><C-L> :<C-U>exec 'Unite ' . join(g:fav_unite_sources, ' ') . ' source'<CR>
endif

if exists('g:loaded_neocomplcache')
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_smart_case = 1
  let g:neocomplcache_min_syntax_length = 3
  imap <expr><ESC> neocomplcache#smart_close_popup() . "\<ESC>"
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-N>" : "\<TAB>")
endif


