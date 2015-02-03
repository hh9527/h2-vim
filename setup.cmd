if not exist "%USERPROFILE%\.vim\bundle" mkdir "%USERPROFILE%\.vim\bundle"
if not exist "%USERPROFILE%\.vim\bundle\Vundle.vim" git clone https://github.com/gmarik/Vundle.vim.git "%USERPROFILE%\.vim\bundle\Vundle.vim"
if not exist "%USERPROFILE%\.vim\bundle\h2-vim" git clone https://github.com/hh9527/h2-vim.git "%USERPROFILE%\.vim\bundle\h2-vim"
echo set nocp > "%USERPROFILE%\_vimrc"
echo source $VIMRUNTIME/mswin.vim >> "%USERPROFILE%\_vimrc"
echo source ~/.vim/bundle/h2-vim/vimrc >> "%USERPROFILE%\_vimrc"
gvim +VundleInstall +qall
