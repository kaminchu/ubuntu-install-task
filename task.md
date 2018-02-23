[TOC]

# 基本
## 更新確認
```sh
$ sudo apt update
$ sudo apt upgrade
```

## ディレクトリ英語化
```sh
$ env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update
```
こっちがいいかも？
```sh
$ env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-update --force
```

## Amazon削除
dockから削除
※17.04以前は↓
```sh
$ sudo apt remove unity-webapps-common
```

## 素のGNOMEにしたい
```sh
$ sudo apt install -y vanilla-gnome-desktopCopy
```


## ウィンドウコントロールを左に移動
```sh
$ gsettings set org.gnome.desktop.wm.preferences button-layout close,minimize,maximize:
```

## gparted
```sh
$ sudo apt install gparted
```
ubuntu17.10でgpartedとかsudoで実行するやつ動かないのでこうした
```sh
$ xhost si:localuser:root
```
作業おわったら、権限を削除する
```sh
$ xhost -si:localuser:root
```

## ゴミ箱削除
```sh
gsettings set org.gnome.nautilus.desktop trash-icon-visible false
```

## 各種コーデック
```sh
$ sudo apt install ubuntu-restricted-extras
```

## Wine
```sh
$ sudo apt install -y wine-stable winetricks
$ winetricks allfonts
```

# 開発
## なんか色々なビルドツール群
```sh
$ sudo apt install build-essential
```

## bashの$の左側が長くてうざい
`~/.bashrc`の下の方に
```
export PS1="\u@\h:\W\\$ \[$(tput sgr0)\]"
```

## git
```sh
$ sudo apt install git
```
```sh
$ git config --global user.name "name"
$ git config --global user.email email@example.com
$ git config --global core.excludesfile ~/.gitignore_global
$ touch ~/.gitignore_global
```
```sh
$ ssh-keygen
```


## curl
```sh
$ sudo apt install curl
```

## anyenv
```sh
$ git clone https://github.com/riywo/anyenv ~/.anyenv
```
~/.bashrcに追記
```sh
if [ -d $HOME/.anyenv ]
then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi
```
読み込み
```sh
$ source ~/.bashrc
```

## goenv
```sh
$ anyenv install goenv
```
golangの任意のバージョンを入れる  
※`goenv install -l`ができないので、ネットで調べて最新ぽいバージョンを入れる
```sh
$ goenv install 1.9
$ goenv global 1.9
```
~/.bashrcに追記
```sh
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
```
読み込み
```sh
$ source ~/.bashrc
```

## ndenv
```sh
$ anyenv install ndenv
```

最新のnodeを入れる
```sh
$ ndenv install -l # 一覧から最新をコピペ
$ ndenv install [最新ver]
$ ndenv global [最新ver]
```

読み込み
```sh
$ source ~/.bashrc
```

## ghq-peco
```sh
$ go get github.com/peco/peco/cmd/peco
$ go get github.com/motemen/ghq
```
ghq setting
```sh
$ git config --global ghq.root ~/.ghq/src
```

~/.bashrcに追記
```sh
alias cr='cd $(ghq list -p | peco)'
```
読み込み
```sh
$ source ~/.bashrc
```

## vscode
```sh
$ sudo snap install --classic vscode
```
## idea
有料版↓
```sh
$ sudo snap install intellij-idea-ultimate --classic
```
```sh
alias idea='intellij-idea-ultimate $1'
```

ライセンスはこちらで買う  
http://samuraism.com/products/jetbrains/intellij-idea

※ギザギザしたら(install時に---edge付けるとなった)↓
アンチエイリアス
http://yamori-jp.blogspot.jp/2012/09/linux-intellij-11.html


## gitkraken
https://www.gitkraken.com/
```sh
$ cd ~/Download
$ wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
$ dpkg -i gitkraken-amd64.deb
```

comanndからの起動の参考  
https://qiita.com/nwtgck/items/18dd0b805b28c6d81008

```sh
alias gk='gitkraken -p $1'
```

## copyするため
```sh
$ sudo apt-get install xsel
```
```
alias pbcopy='xsel --clipboard --input'
```

