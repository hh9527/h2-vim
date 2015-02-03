if [ ! -e ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle
fi
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
if [ ! -e ~/.vim/bundle/h2-vim ]; then
  git clone https://github.com/hh9527/h2-vim.git ~/.vim/bundle/h2-vim
fi

echo "set nocp" > ~/.vimrc
echo "source ~/.vim/bundle/h2-vim/vimrc" >> ~/.vimrc
vim +VundleInstall +qall
