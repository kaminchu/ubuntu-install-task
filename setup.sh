#!/bin/bash
# basic
## update
sudo apt update
sudo apt upgrade -y

## ディレクトリ名変更
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-update --force

## 諸々
sudo apt install -y gparted

# develop
## 諸々
sudo apt install -y git curl xsel

## bash周り
touch ~/.bash_aliases
echo 'export PS1="\u@\h:\W\\$ \[$(tput sgr0)\]"' >> ~/.bashrc
echo "alias pbcopy='xsel --clipboard --input" >> ~/.bash_aliases

## git
git config --global core.excludesfile ~/.gitignore_global
touch ~/.gitignore_global
echo '*~' >> ~/.gitignore_global
echo './idea' >> ~/.gitignore_global
echo '.Trash-*' >> ~/.gitignore_global

## anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(anyenv init -)"' >> ~/.bashrc
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"


## goenv
anyenv install goenv
exec $SHELL -l
goenv install 1.9.5
goenv global 1.9.5
echo 'export GOPATH=$HOME/.go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

## ghq peco
go get github.com/peco/peco/cmd/peco
go get github.com/motemen/ghq
git config --global ghq.root ~/.ghq/src
echo "alias cr='cd $(ghq list -p | peco)'" >> ~/.bash_aliases

## vscode
sudo snap install -y --classic vscode

## idea
sudo snap install intellij-idea-ultimate --classic
echo "alias idea='intellij-idea-ultimate $1'" >> ~/.bash_aliases
source ~/.bashrc

## gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb -P ~/Downloads
dpkg -i ~/Downloads/gitkraken-amd64.deb
echo "alias gk='gitkraken -p $1'" >> ~/.bash_aliases
source ~/.bashrc
