echo "setup 1: download vim plug package manager: vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "setup 2: update/install vim plugins"
vim -u $HOME/.vimrc.bundles +PlugInstall! +PlugClean! +qall

echo "setup 3: compile the YouCompleteMe"
cd $HOME/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
if [ $(which clang) ]; then   # check system clang
    python install.py --clang-completer --system-libclang   # use system clang
else
    python install.py --clang-completer
fi

echo "Install Done!"
