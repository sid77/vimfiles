#!/bin/sh

set -e

GITHUB_DIR="$HOME/src/github.com"

git_clone() {
  REPO_DIR="$GITHUB_DIR/$1"
  mkdir -p $REPO_DIR
  ( cd $REPO_DIR
    if [ -d $2 ]; then
    ( cd $2
      git pull
    )
    else
      git clone https://github.com/$1/$2.git
    fi
  )
}

mkdir -p $HOME/.vim/autoload
git_clone junegunn vim-plug
( cd $HOME/.vim/autoload
  ln -sf $GITHUB_DIR/junegunn/vim-plug/plug.vim
)

mkdir -p $HOME/.vim/colors
git_clone robertmeta nofrils
( cd $HOME/.vim/colors
  ln -sf $GITHUB_DIR/robertmeta/nofrils/colors/nofrils-dark.vim
)

mkdir -p $HOME/.vim/backup
mkdir -p $HOME/.vim/swap
mkdir -p $HOME/.vim/undo
( cd $HOME
  ln -sf $GITHUB_DIR/sid77/vimfiles/nexrc .nexrc
  ln -sf $GITHUB_DIR/sid77/vimfiles/vimrc .vimrc
  vim -c 'PlugInstall | quit | quit'
)
