function! TrySource(fn)
  if filereadable(expand(a:fn))
    exec 'source ' . fnameescape(expand(a:fn))
    return 1
  endif
  return 0
endfunction

filetype off
if has('vim_starting')
  set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin(expand('~/.vim/bundle/'))
Plugin 'gmarik/Vundle.vim'
call TrySource('~/.vim/bundle/h2-vim/vimrc.bundle')
call TrySource('~/.vim.bundle')
Plugin 'hh9527/h2-vim'
call vundle#end()
filetype plugin indent on

if has('win32')
  if $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
    $PATH = $VIM . ';' . $PATH
  endif
endif

if !TrySource('~/.vimrc.default')
  call TrySource('~/.vim/bundle/h2-vim/vimrc.default')
endif
call TrySource('~/.vimrc.local')
