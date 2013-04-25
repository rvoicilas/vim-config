Installation:

    git clone https://github.com/rvoicilas/vim-config.git ~/.vim

Switch to the ~/.vim directory and fetch the git submodules:

    cd ~/.vim
    git submodule init
    git submodule update

Symlink .vimrc:

    ln -s ~/.vim/vimrc ~/.vimrc

If you have any settings you'd like to override, do so in specific.vim:

    vim ~/.vim/specific.vim
