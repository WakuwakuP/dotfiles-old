#!/bin/bash

DOTPATH=~/.dotfiles

mkdir ~/.dotfiles

# homebrew インストール

if !(type "brew" > /dev/null 2>&1); then
    echo "Install Homebrew."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >>~/.profile
fi

/home/linuxbrew/.linuxbrew/bin/brew install tmux peco ghq

# git が使えるなら git

if type "git" > /dev/null 2>&1
then
    git clone --recursive "https://github.com/WakuwakuP/dotfiles.git" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif type "curl" || type "wget" > /dev/null 2>&1
then
    tarball="https://github.com/WakuwakuP/dotfiles/archive/master.tar.gz"

    # どっちかでダウンロードして，tar に流す
    if type "curl" > /dev/null 2>&1
    then
        curl -L "$tarball"

    elif type "wget"> /dev/null 2>&1
    then
        wget -O - "$tarball"

    fi | tar zxv

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    echo "curl or wget required"
fi

cd ~/.dotfiles
if [ $? -ne 0 ]; then
    echo "not found: $DOTPATH"
fi

# 移動できたらリンクを実行する
for f in .??*
do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
