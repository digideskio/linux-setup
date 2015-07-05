#!/bin/sh
bold=$(tput bold)
normal=$(tput sgr0)

# install necessary packages
sudo apt-get install mercurial curl vim-nox ctags

# Change Oh My Zsh theme
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"bira\"/g' ~/.zshrc

# Setup Golang
curl -O https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.4.2.linux-amd64.tar.gz
mkdir ~/go
mkdir ~/go/bin
mkdir ~/go/pkg
mkdir ~/go/src
echo export GOPATH=\"\$HOME/go\" >> ~/.zshrc
echo export PATH=\"\$PATH:/usr/local/go/bin:$GOPATH/bin\" >> ~/.zshrc
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
go get -u github.com/jstemmer/gotags
go get -u github.com/nsf/gocode
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/rogpeppe/godef
go get -u golang.org/x/tools/cmd/oracle
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/golang/lint/golint
go get -u github.com/kisielk/errcheck

## Setup vim

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/vimrc.old\033[0m";
  mv ~/.vimrc ~/vimrc.old;
fi
curl -Lo ~/.vimrc https://raw.githubusercontent.com/mapitman/linux-setup/master/vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -Lo ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/colors && \
curl -Lo ~/.vim/colors/atom-dark.vim https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark.vim
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/Shougo/neocomplete.vim.git ~/.vim/bundle/neocomplete
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
echo export EDITOR=\"vim\" >> ~/.zshrc
echo export VISUAL=\"\$EDITOR\" >> ~/.zshrc
