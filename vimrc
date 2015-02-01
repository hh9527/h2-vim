function! TrySource(fn)
  if filereadable(expand(a:fn))
    exec "source " . fnameescape(expand(a:fn))
    return 1
  endif
  return 0
endfunction

set nocp
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
vundle#begin("~/.vim/bundle/")
Plugin "gmarik/Vundle.vim"
call TrySource("~/.vim/bundle/h2-vim/vimrc.bundle")
vundle#end()
filetype syntax indent on

if !TrySource("~/.vimrc.default")
  call TrySource("~/.vim/bundle/h2-vim/vimrc.default")
endif
TrySource("~/.vimrc.local")
