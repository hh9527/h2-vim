function! TrySource(fn)
  if filereadable(expand(a:fn))
    exec "source " . fnameescape(expand(a:fn))
    return 1
  endif
  return 0
endfunction

if has("win32")
  if $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
    $PATH = $VIM . ';' . $PATH
  endif
endif

if has('vim_starting')
  set nocp
  set rtp+=~/.vim/bundle/Vundle.vim
endif

filetype off
vundle#begin(expand("~/.vim/bundle/"))
Plugin "gmarik/Vundle.vim"
call TrySource("~/.vim/bundle/h2-vim/vimrc.bundle")
call TrySource("~/.vim.bundle")
vundle#end()
filetype plugin indent on

if !TrySource("~/.vimrc.default")
  call TrySource("~/.vim/bundle/h2-vim/vimrc.default")
endif
TrySource("~/.vimrc.local")
