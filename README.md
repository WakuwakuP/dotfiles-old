# Dotfiles

## install

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
source ~/.bashrc ~/.profile
brew install tmux peco ghq python

pip install powerline-shell
```

```bash
curl -L raw.githubusercontent.com/WakuwakuP/dotfiles/master/install.sh | bash
```
