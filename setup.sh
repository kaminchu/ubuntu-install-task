#!/bin/bash
# basic
## update
sudo apt update
sudo apt upgrade -y

## ディレクトリ名変更
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-update --force

# ゴミ箱消す
gsettings set org.gnome.nautilus.desktop trash-icon-visible false

## 諸々
sudo apt install -y gparted

# develop
## 諸々
sudo apt install -y git curl xsel

## bash周り
touch ~/.bash_aliases
echo 'export PS1="\u@\h:\W\\$ \[$(tput sgr0)\]"' >> ~/.bashrc
echo "alias pbcopy='xsel --clipboard --input'" >> ~/.bash_aliases

## git
git config --global core.excludesfile ~/.gitignore_global
touch ~/.gitignore_global
echo '*~' >> ~/.gitignore_global
echo './idea' >> ~/.gitignore_global
echo '.Trash-*' >> ~/.gitignore_global

## fzf
git clone https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

## anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(anyenv init -)"' >> ~/.bashrc
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

## node環境を素で入れたいなら
# curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
# sudo apt-get install -y nodejs yarn


## goenv
# anyenv install goenv
# exec $SHELL -l
# goenv install 1.10.0
# goenv global 1.10.0
# echo 'export GOPATH=$HOME/.go' >> ~/.bashrc
# echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
# export GOPATH=$HOME/.go
# export PATH=$PATH:$GOPATH/bin
sudo snap install go --classic
echo 'export GOPATH=$HOME/.go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc

## ghq ~~peco~~ fzf
# go get github.com/peco/peco/cmd/peco
go get github.com/motemen/ghq
git config --global ghq.root ~/.ghq/src
echo "alias cr='cd \$(ghq list -p | fzf --reverse)'" >> ~/.bash_aliases

## vscode
# Ubuntu18.10ではsnapでvscode入れると激遅プンプン丸だったので、素直にdeb落として入れたほうがいい
# sudo snap install --classic vscode

## idea(あとでアクティベートするように)
sudo snap install intellij-idea-ultimate --classic
echo "alias idea='intellij-idea-ultimate $1'" >> ~/.bash_aliases
source ~/.bashrc

## ~~gitkraken~~ 商用利用ダメっぽいので入れない
# wget https://release.gitkraken.com/linux/gitkraken-amd64.deb -P ~/Downloads
# dpkg -i ~/Downloads/gitkraken-amd64.deb
# echo "alias gk='gitkraken -p $1'" >> ~/.bash_aliases
# source ~/.bashrc

## docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable test edge"
sudo apt-get update
sudo apt-get install -y docker-ce

## 手動でやること
# - Chromeのdebをダウンロードして実行
# - VSCodeのdebをダウンロードして実行
# - VSCodeの日本語化
# - ideaのアクティベート
# - アイコンをいい感じにする(ファイラ,terminal,テキストエディタ,vscode,chrome)
# - ディスプレイの配置調整(4KとfullHDを混在させると、サイズ調整がうまくいかないのなんとかならないかな)
# - 秘密鍵の作成`ssh-keygen -t rsa`と公開鍵`cat ~/.ssh/id_rsa.pub`の各種サービスへの登録
# - 日本語入力できるようにするために、右上のアイコンでmozcを選択
# - 全角/半角の切り替えを使いやすく[参考](https://qiita.com/yas-nyan/items/55e764304c67736ff9ba)
